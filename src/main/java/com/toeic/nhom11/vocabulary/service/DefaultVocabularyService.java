package com.toeic.nhom11.vocabulary.service;

import com.toeic.nhom11.vocabulary.dao.VocabularyDao;
import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.VocabularyTopic;
import com.toeic.nhom11.vocabulary.model.VocabularyWord;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Locale;

@Service
@Transactional(readOnly = true)
public class DefaultVocabularyService implements VocabularyService {
    private final VocabularyDao dao;

    public DefaultVocabularyService(VocabularyDao dao) {
        this.dao = dao;
    }

    @Override
    public List<VocabularyTopicSummary> topics(String search, String email) {
        String query = search == null ? "" : search.trim();
        if (query.length() > 200) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Từ khóa tìm kiếm tối đa 200 ký tự.");
        }
        Long userId = email == null ? null : dao.userId(email.toLowerCase(Locale.ROOT))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        return dao.topics(query, userId);
    }

    @Override
    public VocabularyTopic topic(long id) {
        return dao.publishedTopic(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy chủ đề"));
    }

    @Override
    public List<VocabularyWord> words(long topicId) {
        topic(topicId);
        return dao.words(topicId);
    }

    @Override
    public VocabularyWord randomWord() {
        return dao.randomWord()
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chưa có từ vựng để ôn tập"));
    }

    @Override
    @Transactional
    public void bookmark(long wordId, String email) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        VocabularyWord word = dao.word(wordId)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy từ vựng"));
        topic(word.getTopicId());
        long userId = dao.userId(email.toLowerCase(Locale.ROOT))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        dao.bookmark(userId, wordId);
    }
}
