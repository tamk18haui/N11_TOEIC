package com.toeic.nhom11.reading.service;

import com.toeic.nhom11.reading.dao.ReadingDao;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import tools.jackson.databind.json.JsonMapper;
import java.util.*;

@Service
public class ReadingService {
    private static final String[] LABELS = {"Rất dễ", "Dễ", "Trung bình", "Khó", "Rất khó"};
    private final ReadingDao dao;
    private final JsonMapper json = JsonMapper.builder().build();
    public ReadingService(ReadingDao dao) { this.dao = dao; }
    private static long number(Object value) { return ((Number)value).longValue(); }
    private static boolean truth(Object value) { return Boolean.TRUE.equals(value) || value instanceof Number n && n.intValue()==1; }
    private static ResponseStatusException missing() { return new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài luyện."); }
    private static void require(boolean condition, String message) {
        if (!condition) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, message);
    }
    public long user(String email) {
        return dao.rows("SELECT id FROM users WHERE email=? AND status='ACTIVE'", email).stream()
            .map(row -> number(row.get("id"))).findFirst().orElseThrow(missingException());
    }
    private static java.util.function.Supplier<ResponseStatusException> missingException() { return ReadingService::missing; }
    public List<Map<String,Object>> levels(String email) {
        Long user = email == null ? null : user(email);
        var result = new ArrayList<Map<String,Object>>();
        for (int level=1; level<=5; level++) {
            var item = new LinkedHashMap<String,Object>();
            item.put("level", level); item.put("label", LABELS[level-1]);
            var set = dao.level(level);
            long total=0, practiced=0;
            if (set.isPresent()) {
                long id=number(set.get().get("id"));
                total=number(dao.rows("SELECT COUNT(*) AS n FROM practice_questions WHERE practice_set_id=?", id).get(0).get("n"));
                if (user!=null) practiced=number(dao.rows("SELECT COUNT(DISTINCT a.question_id) AS n FROM practice_attempt_answers a JOIN practice_attempts p ON p.id=a.attempt_id JOIN practice_questions q ON q.id=a.question_id WHERE p.user_id=? AND p.practice_set_id=? AND q.practice_set_id=? AND a.selected_option_id IS NOT NULL", user,id,id).get(0).get("n"));
            }
            item.put("total",total); item.put("practiced",practiced);
            item.put("percent",total==0 ? 0 : Math.round(practiced*100.0/total)); result.add(item);
        }
        return result;
    }
    public Map<String,Object> level(int level, String email) {
        if(level<1 || level>5) throw missing();
        return levels(email).get(level-1);
    }
    private Map<String,Object> owned(long id, String email, boolean lock) {
        return dao.rows("SELECT a.*,s.title,s.instructions FROM practice_attempts a JOIN practice_sets s ON s.id=a.practice_set_id WHERE a.id=? AND a.user_id=? AND s.skill='READING' AND s.part_no=5" + (lock ? " FOR UPDATE" : ""),id,user(email))
            .stream().findFirst().orElseThrow(missingException());
    }
    @Transactional
    public long start(int level, String email) {
        require(level>=1 && level<=5,"Cấp độ không hợp lệ.");
        long user=user(email);
        // Serialize start requests from two tabs for the same account.
        dao.rows("SELECT id FROM users WHERE id=? FOR UPDATE",user);
        var set=dao.level(level).orElseThrow(missingException()); long setId=number(set.get("id"));
        var active=dao.rows("SELECT id FROM practice_attempts WHERE user_id=? AND practice_set_id=? AND submitted_at IS NULL ORDER BY id DESC LIMIT 1",user,setId);
        if(!active.isEmpty()) return number(active.get(0).get("id"));
        var questions=dao.questions(setId);
        require(!questions.isEmpty(),"Bộ luyện chưa có câu hỏi.");
        for(var q:questions) {
            var options=dao.options(number(q.get("id")));
            require(options.size()==4 && options.stream().filter(o->truth(o.get("is_correct"))).count()==1
                && options.stream().map(o->o.get("option_label")).collect(java.util.stream.Collectors.toSet()).equals(Set.of("A","B","C","D")),"Câu hỏi chưa có đủ bốn lựa chọn và một đáp án đúng.");
        }
        long attempt=dao.insert("INSERT INTO practice_attempts(user_id,practice_set_id,total_questions,started_at) VALUES(?,?,?,CURRENT_TIMESTAMP)",user,setId,questions.size());
        // Snapshot membership. Newly imported questions do not change an active attempt.
        for(var q:questions) dao.update("INSERT INTO practice_attempt_answers(attempt_id,question_id) VALUES(?,?)",attempt,q.get("id"));
        return attempt;
    }
    @SuppressWarnings("unchecked")
    private Map<String,Object> metadata(Object explanation) {
        if(explanation==null) return Map.of();
        String text=explanation.toString();
        if(text.startsWith("{")) {
            try { return json.readValue(text, Map.class); } catch(RuntimeException ignored) { /* Legacy prose remains readable. */ }
        }
        return Map.of("explanation",text);
    }
    private List<String> words(Map<String,Object> meta) {
        if(!(meta.get("words") instanceof List<?> words)) return List.of();
        return words.stream().filter(String.class::isInstance).map(String.class::cast).limit(30).toList();
    }
    @Transactional(readOnly=true)
    public Map<String,Object> state(long id, String email) {
        var attempt=owned(id,email,false); boolean finished=attempt.get("submitted_at")!=null;
        var data=new LinkedHashMap<String,Object>();
        data.put("id",id); data.put("title",attempt.get("title")); data.put("finished",finished);
        data.put("user_id",attempt.get("user_id")); data.put("total",attempt.get("total_questions"));
        var answers=dao.rows("SELECT a.question_id,a.selected_option_id,a.is_correct,q.question_text,q.explanation,im.file_url AS image_url FROM practice_attempt_answers a JOIN practice_questions q ON q.id=a.question_id LEFT JOIN media_assets im ON im.id=q.image_media_id AND im.media_type='IMAGE' WHERE a.attempt_id=? ORDER BY q.sort_order,q.id",id);
        var questions=new ArrayList<Map<String,Object>>(); int correct=0,answered=0;
        for(var answer:answers) {
            long qid=number(answer.get("question_id")); boolean chosen=answer.get("selected_option_id")!=null;
            if(chosen) {answered++; if(truth(answer.get("is_correct"))) correct++;}
            var meta=metadata(answer.get("explanation"));
            var question=new LinkedHashMap<String,Object>();
            // N11_READING_MEDIA_V43
            question.put("imageUrl",answer.get("image_url"));
            question.put("id",qid); question.put("text",answer.get("question_text")); question.put("translation",meta.getOrDefault("translation",""));
            question.put("selected",answer.get("selected_option_id")); question.put("vocabulary",dao.vocabulary(words(meta)));
            var options=new ArrayList<Map<String,Object>>();
            for(var option:dao.options(qid)) {
                var clean=new LinkedHashMap<String,Object>();
                clean.put("id",option.get("id")); clean.put("label",option.get("option_label")); clean.put("text",option.get("option_text"));
                Object translations=meta.get("options_vi");
                clean.put("translation", translations instanceof Map<?,?> m ? m.get(option.get("option_label")) : "");
                options.add(clean);
                if((chosen||finished) && truth(option.get("is_correct"))) question.put("correct_option",option.get("id"));
            }
            question.put("options",options);
            if(chosen||finished) { question.put("explanation",meta.getOrDefault("explanation","Chưa có giải thích.")); question.put("analysis",meta.getOrDefault("analysis",Map.of())); }
            questions.add(question);
        }
        data.put("questions",questions); data.put("answered",answered); data.put("correct",correct);
        data.put("score",questions.isEmpty()?0:Math.round(correct*10000.0/questions.size())/100.0);
        return data;
    }
    @Transactional
    public Map<String,Object> answer(long id, long question, long option, String email) {
        var attempt=owned(id,email,true);
        if(attempt.get("submitted_at")!=null) throw new ResponseStatusException(HttpStatus.CONFLICT,"Lượt luyện đã kết thúc.");
        var answer=dao.rows("SELECT * FROM practice_attempt_answers WHERE attempt_id=? AND question_id=?",id,question).stream().findFirst().orElseThrow(missingException());
        var selected=dao.options(question).stream().filter(o->number(o.get("id"))==option).findFirst().orElseThrow(()->new ResponseStatusException(HttpStatus.BAD_REQUEST,"Đáp án không thuộc câu hỏi."));
        if(answer.get("selected_option_id")!=null && number(answer.get("selected_option_id"))!=option)
            throw new ResponseStatusException(HttpStatus.CONFLICT,"Bạn đã trả lời câu này. Hãy bắt đầu lượt mới để luyện lại.");
        if(answer.get("selected_option_id")==null)
            dao.update("UPDATE practice_attempt_answers SET selected_option_id=?,is_correct=? WHERE attempt_id=? AND question_id=?",option,truth(selected.get("is_correct")),id,question);
        return state(id,email);
    }
    @Transactional
    public void finish(long id,String email) {
        var attempt=owned(id,email,true);
        if(attempt.get("submitted_at")!=null) return;
        var state=state(id,email);
        dao.update("UPDATE practice_attempts SET correct_count=?,score_percent=?,submitted_at=CURRENT_TIMESTAMP WHERE id=?",state.get("correct"),state.get("score"),id);
    }
    public List<Map<String,Object>> history(String email) {
        return dao.rows("SELECT a.id,s.title,a.correct_count,a.total_questions,a.score_percent,a.submitted_at FROM practice_attempts a JOIN practice_sets s ON s.id=a.practice_set_id WHERE a.user_id=? AND s.skill='READING' AND s.part_no=5 AND a.submitted_at IS NOT NULL ORDER BY a.id DESC LIMIT 20",user(email));
    }
}
