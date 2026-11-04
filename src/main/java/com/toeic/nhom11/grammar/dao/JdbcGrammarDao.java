package com.toeic.nhom11.grammar.dao;

import com.toeic.nhom11.grammar.model.*;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.*;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class JdbcGrammarDao implements GrammarDao {
    private final JdbcTemplate jdbc;
    public JdbcGrammarDao(JdbcTemplate jdbc) { this.jdbc = jdbc; }
    private <T> List<T> rows(String sql, Class<T> type, Object... args) {
        return jdbc.query(sql, BeanPropertyRowMapper.newInstance(type), args);
    }
    private long insert(String sql, Object... args) {
        KeyHolder key = new GeneratedKeyHolder();
        jdbc.update(connection -> {
            var statement = connection.prepareStatement(sql, new String[]{"id"});
            for (int i = 0; i < args.length; i++) statement.setObject(i + 1, args[i]);
            return statement;
        }, key);
        return Objects.requireNonNull(key.getKey()).longValue();
    }
    public List<Topic> topics(boolean publishedOnly) {
        return rows("SELECT *,is_published AS published FROM grammar_topics" +
            (publishedOnly ? " WHERE is_published=true" : "") + " ORDER BY sort_order,id", Topic.class);
    }
    public Optional<Topic> topic(long id) {
        return rows("SELECT *,is_published AS published FROM grammar_topics WHERE id=?", Topic.class,id).stream().findFirst();
    }
    public long saveTopic(Topic t) {
        if(t.getId()==null) return insert("INSERT INTO grammar_topics(title,description,sort_order,is_published) VALUES(?,?,?,?)",
            t.getTitle(),t.getDescription(),t.getSortOrder(),t.getPublished());
        jdbc.update("UPDATE grammar_topics SET title=?,description=?,sort_order=?,is_published=? WHERE id=?",
            t.getTitle(),t.getDescription(),t.getSortOrder(),t.getPublished(),t.getId());
        return t.getId();
    }
    public void deleteTopic(long id) { jdbc.update("DELETE FROM grammar_topics WHERE id=?",id); }
    private static final String LESSON_SELECT = """
        SELECT l.*,l.is_published AS published,t.title AS topic_title,
          (SELECT COUNT(*) FROM grammar_questions q WHERE q.lesson_id=l.id) AS question_count
        FROM grammar_lessons l JOIN grammar_topics t ON t.id=l.topic_id
        """;
    public List<Lesson> lessons(String search, Long topicId, String level, boolean publishedOnly) {
        StringBuilder sql=new StringBuilder(LESSON_SELECT+" WHERE 1=1");
        List<Object> args=new ArrayList<>();
        if(publishedOnly) sql.append(" AND l.is_published=true AND t.is_published=true");
        if(search!=null&&!search.isBlank()) {
            sql.append(" AND (LOWER(l.title) LIKE ? OR LOWER(l.content_html) LIKE ?)");
            String term="%"+search.toLowerCase(Locale.ROOT)+"%"; args.add(term);args.add(term);
        }
        if(topicId!=null) {sql.append(" AND l.topic_id=?");args.add(topicId);}
        if(level!=null&&!level.isBlank()) {sql.append(" AND l.level=?");args.add(level);}
        sql.append(" ORDER BY t.sort_order,l.sort_order,l.id");
        return rows(sql.toString(),Lesson.class,args.toArray()).stream().map(this::decodeLesson).toList();
    }
    public Optional<Lesson> lesson(long id) { return rows(LESSON_SELECT+" WHERE l.id=?",Lesson.class,id).stream().map(this::decodeLesson).findFirst(); }
    public void lockLesson(long id) { jdbc.queryForObject("SELECT id FROM grammar_lessons WHERE id=? FOR UPDATE",Long.class,id); }
    private Lesson decodeLesson(Lesson l) {
        var content=LessonContentCodec.decode(l.getId(),l.getContentHtml());
        l.setSummary(content.summary());l.setContentHtml(content.lecture());return l;
    }
    private LessonContentCodec.Content content(long id) {
        return LessonContentCodec.decode(id,jdbc.queryForObject("SELECT content_html FROM grammar_lessons WHERE id=?",String.class,id));
    }
    public long saveLesson(Lesson l) {
        String html=LessonContentCodec.encode(l.getSummary(),l.getContentHtml(),l.getId()==null?List.of():content(l.getId()).examples());
        if(l.getId()==null) return insert("INSERT INTO grammar_lessons(topic_id,title,content_html,level,sort_order,is_published) VALUES(?,?,?,?,?,?)",
            l.getTopicId(),l.getTitle(),html,l.getLevel(),l.getSortOrder(),l.getPublished());
        jdbc.update("UPDATE grammar_lessons SET topic_id=?,title=?,content_html=?,level=?,sort_order=?,is_published=? WHERE id=?",
            l.getTopicId(),l.getTitle(),html,l.getLevel(),l.getSortOrder(),l.getPublished(),l.getId());
        return l.getId();
    }
    public void deleteLesson(long id) {
        jdbc.update("DELETE FROM grammar_options WHERE question_id IN (SELECT id FROM grammar_questions WHERE lesson_id=?)",id);
        jdbc.update("DELETE FROM grammar_questions WHERE lesson_id=?",id);
        jdbc.update("DELETE FROM grammar_lessons WHERE id=?",id);
    }
    public List<Example> examples(long id) { return content(id).examples(); }
    public long saveExample(Example e) {
        var content=content(e.getLessonId());List<Example> examples=new ArrayList<>(content.examples());
        if(e.getId()==null) e.setId(examples.stream().mapToLong(Example::getId).max().orElse(0)+1);
        examples.removeIf(x->x.getId().equals(e.getId()));examples.add(e);
        jdbc.update("UPDATE grammar_lessons SET content_html=? WHERE id=?",LessonContentCodec.encode(content.summary(),content.lecture(),examples),e.getLessonId());
        return e.getId();
    }
    public void deleteExample(long id,long lessonId) {
        var content=content(lessonId);List<Example> examples=new ArrayList<>(content.examples());examples.removeIf(e->e.getId()==id);
        jdbc.update("UPDATE grammar_lessons SET content_html=? WHERE id=?",LessonContentCodec.encode(content.summary(),content.lecture(),examples),lessonId);
    }
    public List<Question> questions(long lessonId) {
        List<Question> questions=rows("SELECT * FROM grammar_questions WHERE lesson_id=? ORDER BY sort_order,id",Question.class,lessonId);
        List<Option> options=rows("SELECT o.*,o.is_correct AS correct FROM grammar_options o JOIN grammar_questions q ON q.id=o.question_id WHERE q.lesson_id=? ORDER BY o.option_label",Option.class,lessonId);
        for(Question q:questions) q.setOptions(options.stream().filter(o->o.getQuestionId()==q.getId()).toList());
        return questions;
    }
    public long saveQuestion(Question q) {
        long id;
        if(q.getId()==null) id=insert("INSERT INTO grammar_questions(lesson_id,question_text,explanation,difficulty,sort_order) VALUES(?,?,?,?,?)",
            q.getLessonId(),q.getQuestionText(),q.getExplanation(),q.getDifficulty(),q.getSortOrder());
        else {
            id=q.getId();jdbc.update("UPDATE grammar_questions SET question_text=?,explanation=?,difficulty=?,sort_order=? WHERE id=? AND lesson_id=?",
                q.getQuestionText(),q.getExplanation(),q.getDifficulty(),q.getSortOrder(),id,q.getLessonId());
            jdbc.update("DELETE FROM grammar_options WHERE question_id=?",id);
        }
        for(Option o:q.getOptions()) jdbc.update("INSERT INTO grammar_options(question_id,option_label,option_text,is_correct) VALUES(?,?,?,?)",
            id,o.getOptionLabel(),o.getOptionText(),o.getCorrect());
        return id;
    }
    public void deleteQuestion(long id,long lessonId) {
        jdbc.update("DELETE FROM grammar_options WHERE question_id IN (SELECT id FROM grammar_questions WHERE id=? AND lesson_id=?)",id,lessonId);
        jdbc.update("DELETE FROM grammar_questions WHERE id=? AND lesson_id=?",id,lessonId);
    }
    public boolean hasAttempts(long id) { return jdbc.queryForObject("SELECT COUNT(*) FROM grammar_attempts WHERE lesson_id=?",Long.class,id)>0; }
    public long userId(String email) { return jdbc.queryForObject("SELECT id FROM users WHERE email=?",Long.class,email); }
    public long insertAttempt(Attempt a) {
        return insert("INSERT INTO grammar_attempts(user_id,lesson_id,correct_count,total_questions,score_percent,submitted_at) VALUES(?,?,?,?,?,?)",
            a.getUserId(),a.getLessonId(),a.getCorrectCount(),a.getTotalQuestions(),a.getScorePercent(),a.getSubmittedAt());
    }
    public void insertAnswer(Answer a) {
        jdbc.update("INSERT INTO grammar_attempt_answers(attempt_id,question_id,selected_option_id,is_correct) VALUES(?,?,?,?)",
            a.getAttemptId(),a.getQuestionId(),a.getSelectedOptionId(),a.getCorrect());
    }
    public Optional<Attempt> attempt(long id,long userId) {
        return rows("SELECT a.*,l.title AS lesson_title FROM grammar_attempts a JOIN grammar_lessons l ON l.id=a.lesson_id WHERE a.id=? AND a.user_id=?",Attempt.class,id,userId).stream().findFirst();
    }
    public List<Answer> answers(long id) {
        return rows("""
            SELECT a.*,a.is_correct AS correct,q.question_text,q.explanation,
              CONCAT(selected.option_label,'. ',selected.option_text) AS selected_text,
              CONCAT(right_option.option_label,'. ',right_option.option_text) AS correct_text
            FROM grammar_attempt_answers a JOIN grammar_questions q ON q.id=a.question_id
            LEFT JOIN grammar_options selected ON selected.id=a.selected_option_id
            JOIN grammar_options right_option ON right_option.question_id=q.id AND right_option.is_correct=true
            WHERE a.attempt_id=? ORDER BY q.sort_order,q.id
            """,Answer.class,id);
    }
    public List<Attempt> history(long id) {
        return rows("SELECT a.*,l.title AS lesson_title FROM grammar_attempts a JOIN grammar_lessons l ON l.id=a.lesson_id WHERE a.user_id=? ORDER BY a.submitted_at DESC,a.id DESC LIMIT 100",Attempt.class,id);
    }
    public Map<Long,java.math.BigDecimal> bestScores(long userId) {
        Map<Long,java.math.BigDecimal> scores=new HashMap<>();
        jdbc.query("SELECT lesson_id,MAX(score_percent) AS best FROM grammar_attempts WHERE user_id=? GROUP BY lesson_id",
            (org.springframework.jdbc.core.RowCallbackHandler) rs -> scores.put(rs.getLong("lesson_id"),rs.getBigDecimal("best")),userId);
        return scores;
    }
    public Map<String,Object> statistics() {
        return jdbc.queryForMap("SELECT (SELECT COUNT(*) FROM grammar_lessons) AS lessons,(SELECT COUNT(*) FROM grammar_questions) AS questions,(SELECT COUNT(*) FROM grammar_attempts) AS attempts,(SELECT COALESCE(ROUND(AVG(score_percent),1),0) FROM grammar_attempts) AS average");
    }
}
