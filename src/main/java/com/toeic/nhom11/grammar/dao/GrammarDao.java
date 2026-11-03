package com.toeic.nhom11.grammar.dao;

import com.toeic.nhom11.grammar.model.*;
import java.util.*;

public interface GrammarDao {
    List<Topic> topics(boolean publishedOnly);
    Optional<Topic> topic(long id);
    long saveTopic(Topic topic);
    void deleteTopic(long id);
    List<Lesson> lessons(String search, Long topicId, String level, boolean publishedOnly);
    Optional<Lesson> lesson(long id);
    void lockLesson(long id);
    long saveLesson(Lesson lesson);
    void deleteLesson(long id);
    List<Example> examples(long lessonId);
    long saveExample(Example example);
    void deleteExample(long id, long lessonId);
    List<Question> questions(long lessonId);
    long saveQuestion(Question question);
    void deleteQuestion(long id, long lessonId);
    boolean hasAttempts(long lessonId);
    long userId(String email);
    long insertAttempt(Attempt attempt);
    void insertAnswer(Answer answer);
    Optional<Attempt> attempt(long id, long userId);
    List<Answer> answers(long attemptId);
    List<Attempt> history(long userId);
    Map<Long,java.math.BigDecimal> bestScores(long userId);
    Map<String, Object> statistics();
}
