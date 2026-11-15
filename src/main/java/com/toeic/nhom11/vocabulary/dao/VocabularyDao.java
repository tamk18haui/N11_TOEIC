package com.toeic.nhom11.vocabulary.dao;

import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.VocabularyTopic;
import com.toeic.nhom11.vocabulary.model.VocabularyWord;

import java.util.List;
import java.util.Optional;

public interface VocabularyDao {
    List<VocabularyTopicSummary> topics(String search, Long userId);
    Optional<VocabularyTopic> publishedTopic(long id);
    List<VocabularyWord> words(long topicId);
    Optional<VocabularyWord> word(long id);
    Optional<VocabularyWord> randomWord();
    Optional<Long> userId(String email);
    void bookmark(long userId, long wordId);
}
