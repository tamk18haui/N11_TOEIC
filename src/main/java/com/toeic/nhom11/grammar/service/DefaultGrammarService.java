package com.toeic.nhom11.grammar.service;

import com.toeic.nhom11.grammar.dao.GrammarDao;
import com.toeic.nhom11.grammar.model.*;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.math.*;
import java.time.*;
import java.util.*;

@Service
@Transactional(readOnly=true)
public class DefaultGrammarService implements GrammarService {
    private final GrammarDao dao;
    public DefaultGrammarService(GrammarDao dao) { this.dao=dao; }
    private static ResponseStatusException missing() { return new ResponseStatusException(HttpStatus.NOT_FOUND,"Không tìm thấy nội dung"); }
    private static void require(boolean valid,String message) { if(!valid) throw new IllegalArgumentException(message); }
    private static void text(String value,int max,String name) { require(value!=null&&!value.isBlank()&&value.length()<=max,name+" không được trống và tối đa "+max+" ký tự."); }
    private static void optionalText(String value,int max,String name) { require(value==null||value.length()<=max,name+" tối đa "+max+" ký tự."); }
    public List<Topic> topics(boolean admin) { return dao.topics(!admin); }
    public List<Lesson> lessons(String search,Long topicId,String level,boolean admin) {
        optionalText(search,200,"Từ khóa"); return dao.lessons(search,topicId,level,!admin);
    }
    public Lesson lesson(long id,boolean admin) {
        Lesson l=dao.lesson(id).orElseThrow(DefaultGrammarService::missing);
        if(!admin&&(!l.getPublished()||!dao.topic(l.getTopicId()).orElseThrow(DefaultGrammarService::missing).getPublished())) throw missing();
        // Sanitize on read as well: imported database content is not trusted HTML.
        l.setContentHtml(Jsoup.clean(l.getContentHtml(),Safelist.basic().addTags("h2","h3","h4","table","thead","tbody","tr","th","td","hr")));
        return l;
    }
    public List<Example> examples(long id) { return dao.examples(id); }
    public List<Question> questions(long id) { return dao.questions(id); }
    @Transactional public long saveTopic(Topic t) {
        text(t.getTitle(),180,"Tên chủ đề"); optionalText(t.getDescription(),2000,"Mô tả");require(t.getSortOrder()>=0,"Thứ tự phải không âm.");
        if(t.getId()!=null) dao.topic(t.getId()).orElseThrow(DefaultGrammarService::missing);
        return dao.saveTopic(t);
    }
    @Transactional public void deleteTopic(long id) {
        require(dao.lessons(null,id,null,false).isEmpty(),"Chủ đề còn bài học. Hãy chuyển hoặc xóa bài học trước.");dao.deleteTopic(id);
    }
    @Transactional public long saveLesson(Lesson l) {
        text(l.getTitle(),200,"Tên bài học");text(l.getSummary(),600,"Mô tả ngắn");text(l.getContentHtml(),100000,"Bài giảng");
        require(Set.of("BASIC","INTERMEDIATE","ADVANCED").contains(Objects.toString(l.getLevel(),"")),"Mức độ không hợp lệ.");
        require(l.getSortOrder()>=0,"Thứ tự phải không âm."); dao.topic(l.getTopicId()).orElseThrow(DefaultGrammarService::missing);
        if(l.getId()!=null) {
            dao.lockLesson(l.getId());Lesson old=lesson(l.getId(),true);
            require(!dao.hasAttempts(l.getId())||old.getTitle().equals(l.getTitle()),"Bài đã có lượt làm; giữ nguyên tên bài để bảo toàn lịch sử.");
        }
        l.setContentHtml(Jsoup.clean(l.getContentHtml(),Safelist.basic().addTags("h2","h3","h4","table","thead","tbody","tr","th","td","hr")));
        require(!Jsoup.parse(l.getContentHtml()).text().isBlank(),"Bài giảng phải có nội dung văn bản.");
        if(l.getPublished()) {
            require(l.getId()!=null,"Lưu bản nháp, thêm ví dụ và câu hỏi trước khi công bố.");
            require(!dao.examples(l.getId()).isEmpty(),"Cần ít nhất một ví dụ trước khi công bố.");
            List<Question> questions=dao.questions(l.getId());require(!questions.isEmpty(),"Cần ít nhất một câu hỏi trước khi công bố.");
            questions.forEach(this::validateQuestion);
        }
        return dao.saveLesson(l);
    }
    @Transactional public void deleteLesson(long id) {
        lesson(id,true);dao.lockLesson(id);require(!dao.hasAttempts(id),"Bài đã có lượt làm. Hãy bỏ công bố để bảo toàn lịch sử.");dao.deleteLesson(id);
    }
    @Transactional public long saveExample(Example e) {
        lesson(e.getLessonId(),true);dao.lockLesson(e.getLessonId());text(e.getSentence(),2000,"Câu ví dụ");text(e.getTranslation(),2000,"Bản dịch");optionalText(e.getNote(),2000,"Giải thích");require(e.getSortOrder()>=0,"Thứ tự phải không âm.");
        if(e.getId()!=null) require(dao.examples(e.getLessonId()).stream().anyMatch(x->x.getId().equals(e.getId())),"Ví dụ không thuộc bài học này.");
        return dao.saveExample(e);
    }
    @Transactional public void deleteExample(long id,long lessonId) {
        lesson(lessonId,true);dao.lockLesson(lessonId);Lesson l=lesson(lessonId,true);
        require(!l.getPublished()||dao.examples(lessonId).size()>1,"Bài đang công bố cần ít nhất một ví dụ.");dao.deleteExample(id,lessonId);
    }
    private void validateQuestion(Question q) {
        text(q.getQuestionText(),4000,"Câu hỏi");text(q.getExplanation(),4000,"Giải thích");
        require(q.getDifficulty()>=1&&q.getDifficulty()<=3,"Độ khó phải từ 1 đến 3.");require(q.getSortOrder()>=0,"Thứ tự phải không âm.");
        require(q.getOptions()!=null&&q.getOptions().size()==4,"Mỗi câu phải có 4 phương án.");
        Set<String> labels=new HashSet<>();
        for(Option o:q.getOptions()) {text(o.getOptionText(),2000,"Phương án");labels.add(o.getOptionLabel());}
        require(labels.equals(Set.of("A","B","C","D")),"Phương án phải là A, B, C, D.");
        require(q.getOptions().stream().filter(Option::getCorrect).count()==1,"Mỗi câu phải có đúng một đáp án đúng.");
    }
    @Transactional public long saveQuestion(Question q) {
        lesson(q.getLessonId(),true);dao.lockLesson(q.getLessonId());
        require(!dao.hasAttempts(q.getLessonId()),"Bài đã có lượt làm; hãy tạo bài học mới để thay đổi bộ câu hỏi.");validateQuestion(q);
        if(q.getId()!=null) require(dao.questions(q.getLessonId()).stream().anyMatch(x->x.getId().equals(q.getId())),"Câu hỏi không thuộc bài học này.");
        return dao.saveQuestion(q);
    }
    @Transactional public void deleteQuestion(long id,long lessonId) {
        lesson(lessonId,true);dao.lockLesson(lessonId);Lesson l=lesson(lessonId,true);
        require(!dao.hasAttempts(lessonId),"Không thể xóa câu hỏi của bài đã có lượt làm.");
        require(!l.getPublished()||dao.questions(lessonId).size()>1,"Bài đang công bố cần ít nhất một câu hỏi.");dao.deleteQuestion(id,lessonId);
    }
    public boolean hasAttempts(long lessonId) { return dao.hasAttempts(lessonId); }
    @Transactional public long submit(long lessonId,String email,Map<Long,Long> selections) {
        lesson(lessonId,false);dao.lockLesson(lessonId);Lesson l=lesson(lessonId,false);
        List<Question> questions=dao.questions(lessonId);require(!questions.isEmpty(),"Bài học chưa có bài tập.");
        Set<Long> ids=new HashSet<>();questions.forEach(q->ids.add(q.getId()));
        require(ids.containsAll(selections.keySet()),"Có câu hỏi không thuộc bài học này.");
        List<Answer> answers=new ArrayList<>();int correct=0;
        for(Question q:questions) {
            validateQuestion(q);Long selectedId=selections.get(q.getId());
            Option selected=selectedId==null?null:q.getOptions().stream().filter(o->o.getId().equals(selectedId)).findFirst()
                .orElseThrow(()->new IllegalArgumentException("Phương án không thuộc câu hỏi."));
            Option right=q.getOptions().stream().filter(Option::getCorrect).findFirst().orElseThrow();
            Answer a=new Answer();a.setQuestionId(q.getId());a.setSelectedOptionId(selectedId);a.setCorrect(selected!=null&&selected.getCorrect());
            a.setQuestionText(q.getQuestionText());a.setSelectedText(selected==null?null:selected.getOptionLabel()+". "+selected.getOptionText());
            a.setCorrectText(right.getOptionLabel()+". "+right.getOptionText());a.setExplanation(q.getExplanation());answers.add(a);
            if(a.getCorrect()) correct++;
        }
        Attempt a=new Attempt();a.setUserId(dao.userId(email));a.setLessonId(lessonId);a.setLessonTitle(l.getTitle());
        a.setCorrectCount(correct);a.setTotalQuestions(questions.size());
        a.setScorePercent(BigDecimal.valueOf(correct*100L).divide(BigDecimal.valueOf(questions.size()),2,RoundingMode.HALF_UP));
        a.setSubmittedAt(LocalDateTime.now(ZoneOffset.UTC));long id=dao.insertAttempt(a);
        for(Answer answer:answers) {answer.setAttemptId(id);dao.insertAnswer(answer);}return id;
    }
    public Attempt attempt(long id,String email) { return dao.attempt(id,dao.userId(email)).orElseThrow(DefaultGrammarService::missing); }
    public List<Answer> answers(long id,String email) { attempt(id,email);return dao.answers(id); }
    public List<Attempt> history(String email) { return dao.history(dao.userId(email)); }
    public Map<Long,BigDecimal> bestScores(String email) { return dao.bestScores(dao.userId(email)); }
    public Map<String,Object> statistics() { return dao.statistics(); }
}
