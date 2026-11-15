package com.toeic.nhom11.vocabulary.service;

import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.VocabularyTopic;
import com.toeic.nhom11.vocabulary.model.VocabularyWord;

import java.util.List;

public interface VocabularyService {
    List<VocabularyTopicSummary> topics(String search, String email);
    VocabularyTopic topic(long id);
    List<VocabularyWord> words(long topicId);
    VocabularyWord randomWord();
    void bookmark(long wordId, String email);
}
