package com.toeic.nhom11.vocabulary.dao;

import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.VocabularyTopic;
import com.toeic.nhom11.vocabulary.model.VocabularyWord;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class JdbcVocabularyDao implements VocabularyDao {
    private final JdbcTemplate jdbc;

    public JdbcVocabularyDao(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @Override
    public List<VocabularyTopicSummary> topics(String search, Long userId) {
        StringBuilder sql = new StringBuilder("""
            SELECT t.id, t.title, t.description, t.level, t.display_order, t.is_published AS published,
              t.created_at, COUNT(DISTINCT w.id) AS total_words,
              COUNT(DISTINCT CASE WHEN p.status='MASTERED' THEN w.id END) AS mastered_words,
              COUNT(DISTINCT CASE WHEN p.status='LEARNING' THEN w.id END) AS learning_words,
              COUNT(DISTINCT CASE WHEN p.is_bookmarked=true THEN w.id END) AS bookmarked_words,
              CASE WHEN COUNT(DISTINCT w.id)=0 THEN 0
                ELSE ROUND(100.0 * COUNT(DISTINCT CASE WHEN p.status='MASTERED' THEN w.id END)
                  / COUNT(DISTINCT w.id), 1) END AS progress_percent
            FROM vocab_topics t
            LEFT JOIN vocab_words w ON w.topic_id=t.id
            LEFT JOIN user_vocab_progress p ON p.word_id=w.id AND p.user_id=?
            WHERE t.is_published=true
            """);
        Object[] args;
        if (search == null || search.isBlank()) {
            args = new Object[]{userId};
        } else {
            sql.append("""
                 AND (LOWER(t.title) LIKE ? OR EXISTS (
                   SELECT 1 FROM vocab_words matched
                   WHERE matched.topic_id=t.id AND LOWER(matched.word) LIKE ?
                 ))
                """);
            String pattern = "%" + search.toLowerCase(java.util.Locale.ROOT) + "%";
            args = new Object[]{userId, pattern, pattern};
        }
        sql.append("""
             GROUP BY t.id, t.title, t.description, t.level, t.display_order, t.is_published, t.created_at
             ORDER BY t.display_order, t.id
            """);
        return jdbc.query(sql.toString(), BeanPropertyRowMapper.newInstance(VocabularyTopicSummary.class), args);
    }

    @Override
    public Optional<VocabularyTopic> publishedTopic(long id) {
        return jdbc.query(
            "SELECT *, is_published AS published FROM vocab_topics WHERE id=? AND is_published=true",
            BeanPropertyRowMapper.newInstance(VocabularyTopic.class), id).stream().findFirst();
    }

    @Override
    public List<VocabularyWord> words(long topicId) {
        return jdbc.query("SELECT * FROM vocab_words WHERE topic_id=? ORDER BY word",
            BeanPropertyRowMapper.newInstance(VocabularyWord.class), topicId);
    }

    @Override
    public Optional<VocabularyWord> word(long id) {
        return jdbc.query("SELECT * FROM vocab_words WHERE id=?",
            BeanPropertyRowMapper.newInstance(VocabularyWord.class), id).stream().findFirst();
    }

    @Override
    public Optional<VocabularyWord> randomWord() {
        return jdbc.query("""
            SELECT w.* FROM vocab_words w
            JOIN vocab_topics t ON t.id=w.topic_id
            WHERE t.is_published=true
            ORDER BY RAND() LIMIT 1
            """,
            BeanPropertyRowMapper.newInstance(VocabularyWord.class)).stream().findFirst();
    }

    @Override
    public Optional<Long> userId(String email) {
        return jdbc.query("SELECT id FROM users WHERE email=?",
            (rs, row) -> rs.getLong("id"), email).stream().findFirst();
    }

    @Override
    public void bookmark(long userId, long wordId) {
        jdbc.update("""
            INSERT INTO user_vocab_progress
              (user_id, word_id, status, is_bookmarked, review_count, last_reviewed_at)
            VALUES (?, ?, 'NEW', true, 0, NULL)
            ON DUPLICATE KEY UPDATE is_bookmarked=true
            """, userId, wordId);
    }
}
