package com.toeic.nhom11.vocabulary.dao;

import com.toeic.nhom11.vocabulary.dto.VocabularyLessonSummary;
import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.util.*;

@Repository
public class JdbcVocabularyDao implements VocabularyDao {
    private final JdbcTemplate jdbc;

    public JdbcVocabularyDao(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @Override
    public List<VocabularyTopic> topics(boolean publishedOnly) {
        String sql = publishedOnly
            ? "SELECT id, title, description, level, sort_order as sortOrder, is_published as published, created_by as createdBy FROM vocabulary_topics WHERE is_published=1 ORDER BY sort_order, id"
            : "SELECT id, title, description, level, sort_order as sortOrder, is_published as published, created_by as createdBy FROM vocabulary_topics ORDER BY sort_order, id";
        return jdbc.query(sql, BeanPropertyRowMapper.newInstance(VocabularyTopic.class));
    }

    @Override
    public Optional<VocabularyTopic> topic(long id) {
        return jdbc.query("SELECT id, title, description, level, sort_order as sortOrder, is_published as published, created_by as createdBy FROM vocabulary_topics WHERE id=?",
            BeanPropertyRowMapper.newInstance(VocabularyTopic.class), id).stream().findFirst();
    }

    @Override
    public List<VocabularyTopicSummary> topicSummaries(long userId) {
        return jdbc.query("""
            SELECT t.id, t.title, t.description, t.level, t.sort_order AS displayOrder,
                   t.is_published AS published, COUNT(l.id) AS totalLessons,
                   (SELECT COUNT(*) FROM vocabulary_terms vt WHERE vt.topic_id=t.id) AS totalWords,
                   SUM(CASE WHEN p.status='COMPLETED' THEN 1 ELSE 0 END) AS completedLessons,
                   COALESCE(SUM(p.stars), 0) AS totalStars,
                   EXISTS(SELECT 1 FROM vocabulary_quiz_attempts qa
                          WHERE qa.topic_id=t.id AND qa.user_id=? AND qa.quiz_type='PLACEMENT' AND qa.passed=1)
                       AS placementPassed
            FROM vocabulary_topics t
            LEFT JOIN vocabulary_lessons l ON l.topic_id=t.id AND l.is_published=1
            LEFT JOIN user_vocabulary_lesson_progress p ON p.lesson_id=l.id AND p.user_id=?
            WHERE t.is_published=1
            GROUP BY t.id, t.title, t.description, t.level, t.sort_order, t.is_published
            ORDER BY t.sort_order, t.id
            """, (rs, row) -> {
            VocabularyTopicSummary summary = new VocabularyTopicSummary();
            summary.setId(rs.getLong("id"));
            summary.setTitle(rs.getString("title"));
            summary.setDescription(rs.getString("description"));
            summary.setLevel(rs.getString("level"));
            summary.setDisplayOrder(rs.getInt("displayOrder"));
            summary.setPublished(rs.getBoolean("published"));
            summary.setTotalLessons(rs.getInt("totalLessons"));
            summary.setTotalWords(rs.getLong("totalWords"));
            summary.setCompletedLessons(rs.getInt("completedLessons"));
            summary.setTotalStars(rs.getInt("totalStars"));
            summary.setPlacementPassed(rs.getBoolean("placementPassed"));
            summary.setProgressPercent(summary.getTotalLessons() == 0 ? 0
                : summary.getCompletedLessons() * 100.0 / summary.getTotalLessons());
            return summary;
        }, userId, userId);
    }

    @Override
    public List<VocabularyLessonSummary> lessonSummaries(long topicId, long userId) {
        return jdbc.query("""
            SELECT l.id AS lessonId, l.topic_id AS topicId, l.title, l.description,
                   l.sort_order AS sortOrder, l.target_word_count AS targetWordCount,
                   l.is_published AS published, COUNT(DISTINCT lt.term_id) AS wordCount,
                   COALESCE(CAST(p.status AS CHAR), 'NOT_STARTED') AS state,
                   COALESCE(p.best_score, 0) AS bestScore, COALESCE(p.stars, 0) AS stars
            FROM vocabulary_lessons l
            LEFT JOIN vocabulary_lesson_terms lt ON lt.lesson_id=l.id
            LEFT JOIN user_vocabulary_lesson_progress p ON p.lesson_id=l.id AND p.user_id=?
            WHERE l.topic_id=? AND l.is_published=1
            GROUP BY l.id, l.topic_id, l.title, l.description, l.sort_order,
                     l.target_word_count, l.is_published, p.status, p.best_score, p.stars
            ORDER BY l.sort_order, l.id
            """, (rs, row) -> {
            VocabularyLessonSummary summary = new VocabularyLessonSummary();
            VocabularyLesson lesson = new VocabularyLesson();
            lesson.setId(rs.getLong("lessonId"));
            lesson.setTopicId(rs.getLong("topicId"));
            lesson.setTitle(rs.getString("title"));
            lesson.setDescription(rs.getString("description"));
            lesson.setSortOrder(rs.getInt("sortOrder"));
            lesson.setTargetWordCount(rs.getInt("targetWordCount"));
            lesson.setPublished(rs.getBoolean("published"));
            summary.setLesson(lesson);
            summary.setWordCount(rs.getInt("wordCount"));
            summary.setState(rs.getString("state"));
            summary.setBestScore(rs.getBigDecimal("bestScore"));
            summary.setStars(rs.getInt("stars"));
            return summary;
        }, userId, topicId);
    }

    @Override
    public Optional<VocabularyLesson> lesson(long topicId, long lessonId) {
        return jdbc.query("""
            SELECT id, topic_id AS topicId, title, description, sort_order AS sortOrder,
                   target_word_count AS targetWordCount, is_published AS published
            FROM vocabulary_lessons
            WHERE topic_id=? AND id=? AND is_published=1
            """, BeanPropertyRowMapper.newInstance(VocabularyLesson.class), topicId, lessonId)
            .stream().findFirst();
    }

    @Override
    public List<VocabularyWord> lessonWords(long lessonId) {
        return jdbc.query("""
            SELECT t.id, t.topic_id AS topicId, t.word, t.ipa, t.meaning_vi AS meaningVi,
                   t.definition_en AS definitionEn, t.example_en AS exampleEn,
                   t.example_vi AS exampleVi, t.audio_media_id AS audioMediaId,
                   m.file_url AS audioUrl
            FROM vocabulary_lesson_terms lt
            JOIN vocabulary_terms t ON t.id=lt.term_id
            LEFT JOIN media_assets m ON m.id=t.audio_media_id
            WHERE lt.lesson_id=?
            ORDER BY lt.sort_order, t.id
            """, BeanPropertyRowMapper.newInstance(VocabularyWord.class), lessonId);
    }

    @Override
    public List<VocabularyWord> words(long topicId) {
        return jdbc.query("""
            SELECT t.id, t.topic_id AS topicId, t.word, t.ipa, t.meaning_vi AS meaningVi,
                   t.definition_en AS definitionEn, t.example_en AS exampleEn,
                   t.example_vi AS exampleVi, t.audio_media_id AS audioMediaId,
                   m.file_url AS audioUrl
            FROM vocabulary_terms t
            LEFT JOIN media_assets m ON m.id=t.audio_media_id
            WHERE t.topic_id=?
            ORDER BY t.word
            """,
            BeanPropertyRowMapper.newInstance(VocabularyWord.class), topicId);
    }

    @Override
    public List<VocabularyLesson> lessons(long topicId) {
        return jdbc.query("""
            SELECT id, topic_id AS topicId, title, description, sort_order AS sortOrder,
                   target_word_count AS targetWordCount, is_published AS published
            FROM vocabulary_lessons WHERE topic_id=? ORDER BY sort_order, id
            """, BeanPropertyRowMapper.newInstance(VocabularyLesson.class), topicId);
    }

    @Override
    public List<VocabularyTerm> terms(long topicId) {
        return jdbc.query("""
            SELECT id, topic_id AS topicId, word, ipa, meaning_vi AS meaningVi,
                   definition_en AS definitionEn, example_en AS exampleEn,
                   example_vi AS exampleVi, audio_media_id AS audioMediaId
            FROM vocabulary_terms WHERE topic_id=? ORDER BY word, id
            """, BeanPropertyRowMapper.newInstance(VocabularyTerm.class), topicId);
    }

    @Override
    public List<VocabularyWord> allWords() {
        return jdbc.query("""
            SELECT t.id, t.topic_id AS topicId, t.word, t.ipa, t.meaning_vi AS meaningVi,
                   t.definition_en AS definitionEn, t.example_en AS exampleEn,
                   t.example_vi AS exampleVi, t.audio_media_id AS audioMediaId,
                   m.file_url AS audioUrl
            FROM vocabulary_terms t
            JOIN vocabulary_topics p ON p.id=t.topic_id
            LEFT JOIN media_assets m ON m.id=t.audio_media_id
            WHERE p.is_published=1
            ORDER BY t.id
            """, BeanPropertyRowMapper.newInstance(VocabularyWord.class));
    }

    @Override
    public Optional<VocabularyWord> word(long id) {
        return jdbc.query("""
            SELECT t.id, t.topic_id AS topicId, t.word, t.ipa, t.meaning_vi AS meaningVi,
                   t.definition_en AS definitionEn, t.example_en AS exampleEn,
                   t.example_vi AS exampleVi, t.audio_media_id AS audioMediaId,
                   m.file_url AS audioUrl
            FROM vocabulary_terms t
            LEFT JOIN media_assets m ON m.id=t.audio_media_id
            WHERE t.id=?
            """,
            BeanPropertyRowMapper.newInstance(VocabularyWord.class), id).stream().findFirst();
    }

    @Override
    public Optional<VocabularyTerm> term(long id) {
        return jdbc.query("""
            SELECT id, topic_id AS topicId, word, ipa, meaning_vi AS meaningVi,
                   definition_en AS definitionEn, example_en AS exampleEn,
                   example_vi AS exampleVi, audio_media_id AS audioMediaId
            FROM vocabulary_terms WHERE id=?
            """, BeanPropertyRowMapper.newInstance(VocabularyTerm.class), id)
            .stream().findFirst();
    }

    @Override
    public Optional<VocabularyWord> randomWord() {
        return jdbc.query("""
            SELECT t.id, t.topic_id as topicId, t.word, t.ipa, t.meaning_vi as meaningVi, t.definition_en as definitionEn,
                   t.example_en as exampleEn, t.example_vi as exampleVi, t.audio_media_id as audioMediaId,
                   m.file_url as audioUrl
            FROM vocabulary_terms t
            JOIN vocabulary_topics p ON p.id=t.topic_id
            LEFT JOIN media_assets m ON m.id=t.audio_media_id
            WHERE p.is_published=1
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
    public long insertAttempt(VocabularyQuizAttempt attempt) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbc.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO vocabulary_quiz_attempts "
                    + "(user_id, topic_id, lesson_id, quiz_type, question_count, correct_count, passed) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)",
                new String[]{"id"});
            ps.setLong(1, attempt.getUserId());
            ps.setLong(2, attempt.getTopicId());
            if (attempt.getLessonId() == null) ps.setNull(3, java.sql.Types.BIGINT);
            else ps.setLong(3, attempt.getLessonId());
            ps.setString(4, attempt.getQuizType());
            ps.setInt(5, attempt.getQuestionCount());
            ps.setInt(6, attempt.getCorrectCount());
            ps.setBoolean(7, attempt.isPassed());
            return ps;
        }, keyHolder);
        Number key = keyHolder.getKey();
        return key != null ? key.longValue() : -1L;
    }

    @Override
    public void insertAnswer(VocabularyQuizAttemptAnswer answer) {
        jdbc.update(
            "INSERT INTO vocabulary_quiz_answers "
                + "(attempt_id, question_number, term_id, selected_term_id, typed_answer, is_correct) "
                + "VALUES (?, ?, ?, ?, ?, ?)",
            answer.getAttemptId(), answer.getQuestionNumber(), answer.getTermId(), answer.getSelectedTermId(),
            answer.getTypedAnswer(), answer.isCorrect());
    }

    @Override
    public Optional<VocabularyQuizAttempt> attempt(long id, long userId) {
        return jdbc.query("""
            SELECT a.id, a.user_id as userId, a.topic_id as topicId, a.lesson_id as lessonId,
                   t.title as topicTitle, l.title as lessonTitle, a.quiz_type as quizType,
                   a.question_count as questionCount, a.correct_count as correctCount,
                   a.passed, a.submitted_at as submittedAt
            FROM vocabulary_quiz_attempts a
            JOIN vocabulary_topics t ON t.id=a.topic_id
            LEFT JOIN vocabulary_lessons l ON l.id=a.lesson_id
            WHERE a.id=? AND a.user_id=?
            """,
            BeanPropertyRowMapper.newInstance(VocabularyQuizAttempt.class), id, userId).stream().findFirst();
    }

    @Override
    public List<VocabularyQuizAttemptAnswer> answers(long attemptId) {
        return jdbc.query("SELECT id, attempt_id as attemptId, question_number as questionNumber, term_id as termId, "
                + "selected_term_id as selectedTermId, typed_answer as typedAnswer, "
                + "is_correct as correct FROM vocabulary_quiz_answers WHERE attempt_id=? "
                + "ORDER BY question_number",
            BeanPropertyRowMapper.newInstance(VocabularyQuizAttemptAnswer.class), attemptId);
    }

    @Override
    public List<VocabularyQuizAttempt> history(long userId) {
        return jdbc.query("""
            SELECT a.id, a.user_id as userId, a.topic_id as topicId, a.lesson_id as lessonId,
                   t.title as topicTitle, l.title as lessonTitle, a.quiz_type as quizType,
                   a.question_count as questionCount, a.correct_count as correctCount,
                   a.passed, a.submitted_at as submittedAt
            FROM vocabulary_quiz_attempts a
            JOIN vocabulary_topics t ON t.id=a.topic_id
            LEFT JOIN vocabulary_lessons l ON l.id=a.lesson_id
            WHERE a.user_id=?
            ORDER BY a.submitted_at DESC
            """,
            BeanPropertyRowMapper.newInstance(VocabularyQuizAttempt.class), userId);
    }

    @Override
    public Map<Long, java.math.BigDecimal> bestScores(long userId) {
        Map<Long, java.math.BigDecimal> scores = new HashMap<>();
        jdbc.query("""
            SELECT topic_id, MAX(ROUND(100.0 * correct_count / question_count, 1)) as score
            FROM vocabulary_quiz_attempts
            WHERE user_id=? AND quiz_type='TOPIC'
            GROUP BY topic_id
            """,
            rs -> {
                scores.put(rs.getLong("topic_id"),
                    java.math.BigDecimal.valueOf(rs.getDouble("score")));
            }, userId);
        return scores;
    }

    @Override
    public boolean placementPassed(long topicId, long userId) {
        Integer count = jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_quiz_attempts
            WHERE topic_id=? AND user_id=? AND quiz_type='PLACEMENT' AND passed=1
            """, Integer.class, topicId, userId);
        return count != null && count > 0;
    }

    @Override
    public void updateLessonProgress(long lessonId, long userId,
                                    java.math.BigDecimal score, int stars) {
        boolean completed = score.compareTo(java.math.BigDecimal.valueOf(70)) >= 0;
        int updated = jdbc.update("""
            UPDATE user_vocabulary_lesson_progress
            SET status=CASE WHEN status='COMPLETED' OR ? THEN 'COMPLETED' ELSE 'IN_PROGRESS' END,
                best_score=GREATEST(best_score, ?), stars=GREATEST(stars, ?), updated_at=CURRENT_TIMESTAMP
            WHERE user_id=? AND lesson_id=?
            """, completed, score, stars, userId, lessonId);
        if (updated == 0) {
            jdbc.update("""
                INSERT INTO user_vocabulary_lesson_progress (user_id, lesson_id, status, best_score, stars)
                VALUES (?, ?, ?, ?, ?)
                """, userId, lessonId, completed ? "COMPLETED" : "IN_PROGRESS", score, stars);
        }
    }

    @Override
    public VocabularyUserPreferences preferences(long userId) {
        return jdbc.query("""
            SELECT theme, font_size AS fontSize, language
            FROM user_vocabulary_preferences WHERE user_id=?
            """, BeanPropertyRowMapper.newInstance(VocabularyUserPreferences.class), userId)
            .stream().findFirst().orElseGet(VocabularyUserPreferences::new);
    }

    @Override
    public void updatePreferences(long userId, VocabularyUserPreferences preferences) {
        int updated = jdbc.update("""
            UPDATE user_vocabulary_preferences
            SET theme=?, font_size=?, language=?, updated_at=CURRENT_TIMESTAMP
            WHERE user_id=?
            """, preferences.getTheme(), preferences.getFontSize(), preferences.getLanguage(), userId);
        if (updated == 0) {
            jdbc.update("""
                INSERT INTO user_vocabulary_preferences (user_id, theme, font_size, language)
                VALUES (?, ?, ?, ?)
                """, userId, preferences.getTheme(), preferences.getFontSize(),
                preferences.getLanguage());
        }
    }

    @Override
    public void updateProgress(long userId, long termId, String learningStatus) {
        int updated = jdbc.update(
            "UPDATE user_vocabulary_progress SET learning_status=?, updated_at=CURRENT_TIMESTAMP WHERE user_id=? AND term_id=?",
            learningStatus, userId, termId);
        if (updated == 0) {
            jdbc.update(
                "INSERT INTO user_vocabulary_progress (user_id, term_id, learning_status) VALUES (?, ?, ?)",
                userId, termId, learningStatus);
        }
    }

    @Override
    public void markFavorite(long userId, long termId, boolean favorite) {
        int updated = jdbc.update(
            "UPDATE user_vocabulary_progress SET is_favorite=?, updated_at=CURRENT_TIMESTAMP WHERE user_id=? AND term_id=?",
            favorite, userId, termId);
        if (updated == 0) {
            jdbc.update(
                "INSERT INTO user_vocabulary_progress (user_id, term_id, is_favorite) VALUES (?, ?, ?)",
                userId, termId, favorite);
        }
    }

    @Override
    public long saveTopic(VocabularyTopic topic) {
        if (topic.getId() == null) {
            return insert("""
                INSERT INTO vocabulary_topics
                  (title, description, level, sort_order, is_published)
                VALUES (?, ?, ?, ?, ?)
                """, topic.getTitle(), topic.getDescription(), topic.getLevel(),
                topic.getSortOrder(), topic.getPublished());
        }
        jdbc.update("""
            UPDATE vocabulary_topics
            SET title=?, description=?, level=?, sort_order=?, is_published=?
            WHERE id=?
            """, topic.getTitle(), topic.getDescription(), topic.getLevel(),
            topic.getSortOrder(), topic.getPublished(), topic.getId());
        return topic.getId();
    }

    @Override
    public void deleteTopic(long id) {
        jdbc.update("DELETE FROM vocabulary_topics WHERE id=?", id);
    }

    @Override
    public long saveLesson(VocabularyLesson lesson) {
        if (lesson.getId() == null) {
            return insert("""
                INSERT INTO vocabulary_lessons
                  (topic_id, title, description, sort_order, target_word_count, is_published)
                VALUES (?, ?, ?, ?, ?, ?)
                """, lesson.getTopicId(), lesson.getTitle(), lesson.getDescription(),
                lesson.getSortOrder(), lesson.getTargetWordCount(), lesson.getPublished());
        }
        jdbc.update("""
            UPDATE vocabulary_lessons
            SET topic_id=?, title=?, description=?, sort_order=?, target_word_count=?, is_published=?
            WHERE id=?
            """, lesson.getTopicId(), lesson.getTitle(), lesson.getDescription(),
            lesson.getSortOrder(), lesson.getTargetWordCount(), lesson.getPublished(),
            lesson.getId());
        return lesson.getId();
    }

    @Override
    public void deleteLesson(long id) {
        jdbc.update("DELETE FROM vocabulary_lesson_terms WHERE lesson_id=?", id);
        jdbc.update("DELETE FROM vocabulary_lessons WHERE id=?", id);
    }

    @Override
    public long saveTerm(VocabularyTerm term) {
        if (term.getId() == null) {
            return insert("""
                INSERT INTO vocabulary_terms
                  (topic_id, word, ipa, meaning_vi, definition_en, example_en, example_vi, audio_media_id)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """, term.getTopicId(), term.getWord(), term.getIpa(), term.getMeaningVi(),
                term.getDefinitionEn(), term.getExampleEn(), term.getExampleVi(),
                term.getAudioMediaId());
        }
        jdbc.update("""
            UPDATE vocabulary_terms
            SET topic_id=?, word=?, ipa=?, meaning_vi=?, definition_en=?, example_en=?,
                example_vi=?, audio_media_id=?
            WHERE id=?
            """, term.getTopicId(), term.getWord(), term.getIpa(), term.getMeaningVi(),
            term.getDefinitionEn(), term.getExampleEn(), term.getExampleVi(),
            term.getAudioMediaId(), term.getId());
        return term.getId();
    }

    @Override
    public void deleteTerm(long id) {
        jdbc.update("DELETE FROM vocabulary_terms WHERE id=?", id);
    }

    @Override
    public void assignLessonTerms(long lessonId, long topicId, int limit) {
        jdbc.update("DELETE FROM vocabulary_lesson_terms WHERE lesson_id=?", lessonId);
        jdbc.update("""
            INSERT INTO vocabulary_lesson_terms(lesson_id, term_id, sort_order)
            SELECT ?, ranked.id, ranked.term_order
            FROM (
                SELECT t.id, ROW_NUMBER() OVER (ORDER BY t.id) AS term_order
                FROM vocabulary_terms t
                WHERE t.topic_id=?
            ) ranked
            WHERE ranked.term_order <= ?
            """, lessonId, topicId, limit);
    }

    @Override
    public Map<String, Object> statistics() {
        return jdbc.queryForMap("""
            SELECT
              (SELECT COUNT(*) FROM vocabulary_topics) AS topics,
              (SELECT COUNT(*) FROM vocabulary_lessons) AS lessons,
              (SELECT COUNT(*) FROM vocabulary_terms) AS terms,
              (SELECT COUNT(*) FROM vocabulary_quiz_attempts) AS attempts,
              (SELECT COALESCE(ROUND(AVG(100.0 * correct_count / NULLIF(question_count, 0)), 1), 0)
                 FROM vocabulary_quiz_attempts) AS average
            """);
    }

    private long insert(String sql, Object... arguments) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbc.update(connection -> {
            PreparedStatement statement = connection.prepareStatement(sql, new String[]{"id"});
            for (int index = 0; index < arguments.length; index++) {
                statement.setObject(index + 1, arguments[index]);
            }
            return statement;
        }, keyHolder);
        Number key = keyHolder.getKey();
        return key == null ? -1L : key.longValue();
    }
}
