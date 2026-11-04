package com.toeic.nhom11.grammar.service;

import com.toeic.nhom11.grammar.model.*;
import java.util.*;

public interface GrammarService {
    List<Topic> topics(boolean admin);
    List<Lesson> lessons(String search,Long topicId,String level,boolean admin);
    Lesson lesson(long id,boolean admin);
    List<Example> examples(long lessonId);
    List<Question> questions(long lessonId);
    List<Question> quizQuestions(long lessonId);
    QuestionReview checkPractice(long lessonId, long questionId, long optionId);
    Map<Long, QuestionReview> reviews(long attemptId, String email);
    long saveTopic(Topic topic);
    void deleteTopic(long id);
    long saveLesson(Lesson lesson);
    void deleteLesson(long id);
    long saveExample(Example example);
    void deleteExample(long id,long lessonId);
    long saveQuestion(Question question);
    void deleteQuestion(long id,long lessonId);
    boolean hasAttempts(long lessonId);
    long submit(long lessonId,String email,Map<Long,Long> selections);
    Attempt attempt(long id,String email);
    List<Answer> answers(long attemptId,String email);
    List<Attempt> history(String email);
    Map<Long,java.math.BigDecimal> bestScores(String email);
    Map<String,Object> statistics();
}
