package com.toeic.nhom11.vocabulary.service;

import com.toeic.nhom11.vocabulary.dto.VocabularyLessonSummary;
import com.toeic.nhom11.vocabulary.dto.VocabularyQuiz;
import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.*;
import java.util.*;

public interface VocabularyService {
    List<VocabularyTopic> topics(boolean admin);
    List<VocabularyTopicSummary> topicSummaries(String email);
    VocabularyTopic topic(long id, boolean admin);
    List<VocabularyLessonSummary> lessonSummaries(long topicId, String email);
    VocabularyLesson beginLesson(long topicId, long lessonId, String email);
    List<VocabularyWord> lessonWords(long topicId, long lessonId);
    List<VocabularyWord> words(long topicId);
    VocabularyWord word(long id);
    Optional<VocabularyWord> randomWord();
    long submit(long topicId, String email, Map<Long, Long> selections);
    VocabularyQuizAttempt attempt(long id, String email);
    List<VocabularyQuizAttemptAnswer> answers(long attemptId, String email);
    List<VocabularyQuizAttempt> history(String email);
    Map<Long, java.math.BigDecimal> bestScores(String email);
    boolean placementPassed(long topicId, String email);
    VocabularyQuiz startPlacementQuiz(long topicId, String email);
    VocabularyQuiz startLessonQuiz(long topicId, long lessonId, String mode, String email);
    long submitLearningQuiz(VocabularyQuiz quiz, String email, Map<String, String> responses);
    VocabularyUserPreferences preferences(String email);
    void updatePreferences(String email, VocabularyUserPreferences preferences);
    void updateProgress(long termId, String email, String learningStatus);
    void markFavorite(long termId, String email, boolean favorite);
    List<VocabularyLesson> lessons(long topicId);
    List<VocabularyTerm> terms(long topicId);
    VocabularyTerm term(long id);
    long saveTopic(VocabularyTopic topic);
    void deleteTopic(long id);
    long saveLesson(VocabularyLesson lesson);
    void deleteLesson(long id);
    long saveTerm(VocabularyTerm term);
    void deleteTerm(long id);
    Map<String, Object> statistics();
}
