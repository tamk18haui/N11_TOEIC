package com.toeic.nhom11.service;

import com.toeic.nhom11.dao.ListeningDao;
import com.toeic.nhom11.model.ListeningSubmission;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Set;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

/** Listening Parts 1-4, five levels each; validates answers and scores on the server. */
@Service
@Transactional(readOnly = true)
public class ListeningService {
    private static final String[] PART_NAMES={"", "Hình ảnh", "Hỏi – Đáp", "Hội thoại ngắn", "Độc thoại"};
    private static final String[] LEVEL_NAMES={"", "Rất dễ", "Dễ", "Trung bình", "Khó", "Rất khó"};
    private static final Pattern LEVEL_PATTERN=Pattern.compile("\\[LISTENING_LEVEL:([1-5])\\]");
    private final ListeningDao dao;
    public ListeningService(ListeningDao dao) { this.dao=dao; }

    private static ResponseStatusException notFound() {
        return new ResponseStatusException(HttpStatus.NOT_FOUND,"Bài luyện Listening không tồn tại hoặc chưa được công bố.");
    }
    private static void bad(boolean invalid,String message) {
        if(invalid) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,message);
    }
    private static long n(Object v) {return ((Number)v).longValue();}
    private static boolean yes(Object v) {return Boolean.TRUE.equals(v)||(v instanceof Number x && x.intValue()!=0);}
    public void requirePartLevel(int part,int level) {
        if(part<1||part>4||level<1||level>5) throw notFound();
    }
    private Long currentUser(String email,boolean required) {
        if(email==null||email.isBlank()) {
            if(required) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Vui lòng đăng nhập để làm bài.");
            return null;
        }
        return dao.activeUser(email.trim().toLowerCase(Locale.ROOT))
            .orElseThrow(()->new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Tài khoản không hoạt động."));
    }
    private Map<String,Object> selected(long id) {
        Map<String,Object> s=dao.set(id).orElseThrow(ListeningService::notFound);
        String instructions=Objects.toString(s.get("instructions"),"");
        if(!instructions.matches("(?s).*\\[LISTENING_LEVEL:[1-5]\\].*")) throw notFound();
        return s;
    }

    private static int levelOf(Map<String,Object> s) {
        Matcher m=LEVEL_PATTERN.matcher(Objects.toString(s.get("instructions"),""));
        return m.find()?Integer.parseInt(m.group(1)):1;
    }
    private static String visibleTitle(int part,int level) {
        return "Listening TOEIC · Part "+part+" · Cấp độ "+level;
    }

    public Map<String,Object> overview(int part,String email) {
        requirePartLevel(part,1);
        Long uid=currentUser(email,false);
        List<Map<String,Object>> levels=new ArrayList<>();
        for(int level=1;level<=5;level++) {
            var sets=dao.sets(part,level);
            int total=0,practiced=0;
            Long selectedId=null;
            for(var set:sets) {
                long setId=n(set.get("id"));int count=(int)n(set.get("question_count"));
                total+=count;
                if(selectedId==null&&count>0) selectedId=setId;
                if(uid!=null) practiced+=dao.practiced(uid,setId);
            }
            Map<String,Object> row=new LinkedHashMap<>();
            row.put("level",level);row.put("label",LEVEL_NAMES[level]);
            row.put("sets",sets.size());row.put("total",total);row.put("practiced",practiced);
            row.put("percent",total==0?0:Math.min(100,Math.round(practiced*100f/total)));
            row.put("setId",selectedId);
            List<Map<String,Object>> visibleSets=new ArrayList<>();
            for(int i=0;i<sets.size();i++) {
                var item=sets.get(i);
                visibleSets.add(Map.of("id",item.get("id"),"title","Bộ luyện "+(i+1),
                    "question_count",item.get("question_count")));
            }
            row.put("setList",visibleSets);
            levels.add(row);
        }
        return Map.of("part",part,"partName",PART_NAMES[part],"levels",levels,"loggedIn",uid!=null);
    }

    /** Do not return correct choices, explanations or transcripts before a choice. */
    public Map<String,Object> exercise(long setId) {
        Map<String,Object> set=selected(setId);
        int part=(int)n(set.get("part_no"));
        List<Map<String,Object>> raw=dao.questions(setId);
        if(raw.isEmpty() || raw.size()>100) throw new ResponseStatusException(HttpStatus.CONFLICT,"Bộ luyện chưa có câu hỏi hợp lệ.");
        List<Map<String,Object>> result=new ArrayList<>();
        for(var q:raw) {
            Map<String,Object> row=new LinkedHashMap<>();
            long questionId=n(q.get("id"));
            row.put("id",questionId);
            // Part 1/2: original TOEIC statements and question prompts are heard, not read in advance.
            row.put("text",part==1?"Look at the photograph and select the best statement."
                :part==2?"Listen and select the best response.":q.get("question_text"));
            row.put("audio",validMedia(q.get("audio_url")));
            row.put("image",validMedia(q.get("image_url")));
            row.put("passageId",q.get("passage_id"));
            List<Map<String,Object>> options=new ArrayList<>();
            for(var o:dao.options(questionId,false)) {
                Map<String,Object> option=new LinkedHashMap<>();
                option.put("id",o.get("id"));option.put("label",o.get("option_label"));
                option.put("text",part<=2?"":o.get("option_text"));
                options.add(option);
            }
            row.put("options",options);
            result.add(row);
        }
        Map<String,Object> output=new LinkedHashMap<>();
        output.put("setId",setId);output.put("part",part);
        output.put("level",levelOf(set));output.put("title",visibleTitle(part,levelOf(set)));
        output.put("questions",result);
        return output;
    }

    /** One persistent practice session per user + set until every question is checked. */
    @Transactional
    public Map<String,Object> startPractice(long setId,String email) {
        long uid=Objects.requireNonNull(currentUser(email,true));
        var exercise=exercise(setId);
        var questions=dao.questions(setId);
        int part=((Number)exercise.get("part")).intValue();
        // Do not start invalid/empty exercises. The public API does not expose answer keys.
        for(var q:questions) {
            var opts=dao.options(n(q.get("id")),true);
            bad(opts.size()!=(part==2?3:4) || opts.stream().filter(o->yes(o.get("is_correct"))).count()!=1,
                "Bộ câu hỏi chưa đủ đáp án hợp lệ.");
        }
        dao.lockUser(uid);
        long attemptId=dao.activeAttempt(uid,setId)
            .orElseGet(()->dao.createOpenAttempt(uid,setId,questions.size()));
        var reviews=new ArrayList<Map<String,Object>>();
        for(var a:dao.checkedAnswers(attemptId)) {
            reviews.add(feedback(setId,n(a.get("question_id")),n(a.get("selected_option_id")),part));
        }
        return Map.of("attemptId",attemptId,"review",reviews,"total",questions.size());
    }

    /** Called after each selection; persists the answer and returns this question's feedback only. */
    @Transactional
    public Map<String,Object> checkAnswer(long setId,long attemptId,long questionId,long optionId,String email) {
        long uid=Objects.requireNonNull(currentUser(email,true));
        var set=selected(setId);
        int part=(int)n(set.get("part_no"));
        var attempt=dao.lockedAttempt(attemptId,uid,setId).orElseThrow(ListeningService::notFound);
        var question=dao.questions(setId).stream().filter(q->n(q.get("id"))==questionId).findFirst()
            .orElseThrow(()->new ResponseStatusException(HttpStatus.BAD_REQUEST,"Câu hỏi không thuộc bộ luyện."));
        var opts=dao.options(questionId,true);
        bad(opts.size()!=(part==2?3:4)||opts.stream().filter(o->yes(o.get("is_correct"))).count()!=1,
            "Câu hỏi chưa có đủ lựa chọn và đáp án đúng.");
        bad(opts.stream().noneMatch(o->n(o.get("id"))==optionId),"Lựa chọn không thuộc câu hỏi.");
        var previous=dao.checkedAnswers(attemptId).stream()
            .filter(row->n(row.get("question_id"))==questionId).findFirst();
        if(previous.isPresent()) {
            // First choice is final; retries always return the already recorded result.
            var saved=feedback(setId,questionId,n(previous.get().get("selected_option_id")),part);
            saved.put("alreadyChecked",true);
            return saved;
        }
        if(attempt.get("submitted_at")!=null)
            throw new ResponseStatusException(HttpStatus.CONFLICT,"Lượt luyện đã hoàn thành.");
        boolean correct=opts.stream().anyMatch(o->n(o.get("id"))==optionId && yes(o.get("is_correct")));
        dao.saveAnswer(attemptId,questionId,optionId,correct);
        dao.refreshAttempt(attemptId,((Number)attempt.get("total_questions")).intValue());
        var result=feedback(setId,questionId,optionId,part);
        int checked=dao.checkedAnswers(attemptId).size();
        result.put("answered",checked);
        result.put("total",attempt.get("total_questions"));
        result.put("completed",checked>=((Number)attempt.get("total_questions")).intValue());
        return result;
    }

    /** Correct answer and transcript are returned for a previously graded question only. */
    private Map<String,Object> feedback(long setId,long questionId,long selectedId,int part) {
        var opts=dao.options(questionId,true);
        var correctOption=opts.stream().filter(o->yes(o.get("is_correct"))).findFirst()
            .orElseThrow(()->new ResponseStatusException(HttpStatus.CONFLICT,"Câu hỏi chưa có đáp án đúng."));
        long correctId=n(correctOption.get("id"));
        var q=dao.explanations(setId).stream().filter(x->n(x.get("id"))==questionId).findFirst()
            .orElseThrow(ListeningService::notFound);
        String raw=Objects.toString(q.get("explanation"),"").trim();
        String passage=Objects.toString(q.get("passage_text"),"").trim();
        // Existing imported Part 1 questions put a four-option transcript into explanation.
        String transcript=raw.regionMatches(true,0,"Transcript:",0,11)
            ?raw.substring(11).trim():passage;
        String explanation=raw.regionMatches(true,0,"Transcript:",0,11)
            ?"Dữ liệu hiện có bản chép lời nhưng chưa có giải thích chi tiết cho câu này."
            :raw.isBlank()?"Chưa có giải thích chi tiết cho câu này.":raw;
        Map<String,Object> out=new LinkedHashMap<>();
        out.put("questionId",questionId);out.put("selectedId",selectedId);
        out.put("correctId",correctId);out.put("correctLabel",correctOption.get("option_label"));
        out.put("correctText",correctOption.get("option_text"));
        out.put("correct",selectedId==correctId);
        out.put("explanation",explanation);out.put("transcript",transcript);
        return out;
    }

    private static String validMedia(Object raw) {
        if(raw==null) return null;
        String value=raw.toString().trim();
        try {
            URI u=URI.create(value);
            if(!"https".equalsIgnoreCase(u.getScheme())||u.getHost()==null||u.getUserInfo()!=null) return null;
            // Public HTTPS URL can be Cloudinary's res.cloudinary.com or a custom delivery domain.
            return value;
        } catch(IllegalArgumentException ex) { return null; }
    }

    @Transactional
    public Map<String,Object> submit(long setId,ListeningSubmission form,String email) {
        long uid=Objects.requireNonNull(currentUser(email,true));
        Map<String,Object> set=selected(setId);
        int part=(int)n(set.get("part_no"));
        var questions=dao.questions(setId);
        if(questions.isEmpty()||questions.size()>100) throw new ResponseStatusException(HttpStatus.CONFLICT,"Bộ luyện chưa có dữ liệu.");
        Map<String,Long> input=form==null||form.answers()==null?Map.of():form.answers();
        bad(input.size()>questions.size(),"Số câu trả lời không hợp lệ.");
        Set<String> ids=new HashSet<>();for(var q:questions) ids.add(String.valueOf(n(q.get("id"))));
        bad(!ids.containsAll(input.keySet()),"Câu hỏi không thuộc bộ luyện.");
        int score=0;
        List<Map<String,Object>> review=new ArrayList<>();
        List<Answer> rows=new ArrayList<>();
        for(var q:questions) {
            long qid=n(q.get("id"));
            var opts=dao.options(qid,true);
            int expected=part==2?3:4;
            if(opts.size()!=expected || opts.stream().filter(o->yes(o.get("is_correct"))).count()!=1)
                throw new ResponseStatusException(HttpStatus.CONFLICT,"Một số câu hỏi chưa đủ đáp án hợp lệ.");
            Long chosen=input.get(String.valueOf(qid));
            if(chosen!=null && opts.stream().noneMatch(o->n(o.get("id"))==chosen))
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Đáp án không thuộc câu hỏi.");
            long correctId=n(opts.stream().filter(o->yes(o.get("is_correct"))).findFirst().orElseThrow().get("id"));
            boolean correct=chosen!=null && chosen==correctId;
            if(correct)score++;
            rows.add(new Answer(qid,chosen,correct));
            Map<String,Object> feedback=new LinkedHashMap<>();
            feedback.put("questionId",qid);feedback.put("selectedId",chosen);feedback.put("correctId",correctId);
            feedback.put("correct",correct);
            review.add(feedback);
        }
        double percent=Math.round(10000.0*score/questions.size())/100.0;
        long attempt=dao.createAttempt(uid,setId,score,questions.size(),percent);
        for(var a:rows) dao.saveAnswer(attempt,a.questionId(),a.optionId(),a.correct());
        var explanations=dao.explanations(setId);
        for(int i=0;i<review.size();i++) {
            var feedback=review.get(i);var explanation=explanations.get(i);
            feedback.put("explanation",explanation.get("explanation"));
            feedback.put("transcript",explanation.get("passage_text"));
        }
        return Map.of("attemptId",attempt,"correct",score,"total",questions.size(),"score",percent,"review",review);
    }
    private record Answer(long questionId,Long optionId,boolean correct) {}

    public List<Map<String,Object>> history(String email) {
        var rows=dao.history(Objects.requireNonNull(currentUser(email,true)));
        var visible=new ArrayList<Map<String,Object>>();
        for(var row:rows) {
            var clean=new LinkedHashMap<String,Object>(row);
            clean.put("title","Luyện nghe TOEIC · Part "+n(row.get("part_no")));
            visible.add(clean);
        }
        return visible;
    }
}
