package com.toeic.nhom11.dao;

import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Objects;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

/** SQL for Listening, using the team's existing practice_* and media_assets tables. */
@Repository
public class ListeningDao {
    private final JdbcTemplate jdbc;
    public ListeningDao(JdbcTemplate jdbc) { this.jdbc = jdbc; }

    public Optional<Long> activeUser(String email) {
        return jdbc.query("SELECT id FROM users WHERE email=? AND status='ACTIVE'",
            (rs, row) -> rs.getLong(1), email).stream().findFirst();
    }

    public List<Map<String,Object>> sets(int part, int level) {
        return jdbc.queryForList("""
            SELECT s.id, s.title, s.part_no,
              (SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=s.id) AS question_count
            FROM practice_sets s
            WHERE s.skill='LISTENING' AND s.part_no=? AND s.is_published=1
              AND s.instructions LIKE ?
            ORDER BY s.id
            """, part, "%[LISTENING_LEVEL:"+level+"]%");
    }

    public Optional<Map<String,Object>> set(long id) {
        return jdbc.queryForList("""
            SELECT id, title, part_no, instructions FROM practice_sets
            WHERE id=? AND skill='LISTENING' AND part_no BETWEEN 1 AND 4 AND is_published=1
            """, id).stream().findFirst();
    }

    public List<Map<String,Object>> questions(long setId) {
        return jdbc.queryForList("""
            SELECT q.id, q.passage_id, q.question_text, q.sort_order,
                   COALESCE(qa.file_url, pa.file_url) AS audio_url, pa.file_url AS passage_audio_url,
                   COALESCE(qi.file_url, pi.file_url) AS image_url
            FROM practice_questions q
            LEFT JOIN practice_passages p ON p.id=q.passage_id AND p.practice_set_id=q.practice_set_id
            LEFT JOIN media_assets qa ON qa.id=q.audio_media_id AND qa.media_type='AUDIO'
            LEFT JOIN media_assets pa ON pa.id=p.audio_media_id AND pa.media_type='AUDIO'
            LEFT JOIN media_assets qi ON qi.id=q.image_media_id AND qi.media_type='IMAGE'
            LEFT JOIN media_assets pi ON pi.id=p.image_media_id AND pi.media_type='IMAGE'
            WHERE q.practice_set_id=? ORDER BY q.sort_order,q.id
            """, setId);
    }

    public List<Map<String,Object>> options(long questionId, boolean includeAnswer) {
        String sql = includeAnswer
          ? "SELECT id,option_label,option_text,is_correct FROM practice_options WHERE question_id=? ORDER BY option_label"
          : "SELECT id,option_label,option_text FROM practice_options WHERE question_id=? ORDER BY option_label";
        return jdbc.queryForList(sql, questionId);
    }

    public List<Map<String,Object>> explanations(long setId) {
        return jdbc.queryForList("""
            SELECT q.id, q.explanation, p.passage_text
            FROM practice_questions q
            LEFT JOIN practice_passages p ON p.id=q.passage_id AND p.practice_set_id=q.practice_set_id
            WHERE q.practice_set_id=? ORDER BY q.sort_order,q.id
            """,setId);
    }

    public int practiced(long userId,long setId) {
        Integer n=jdbc.queryForObject("""
            SELECT COUNT(DISTINCT a.question_id)
            FROM practice_attempt_answers a
            JOIN practice_attempts att ON att.id=a.attempt_id
            JOIN practice_questions q ON q.id=a.question_id
            WHERE att.user_id=? AND att.practice_set_id=? AND q.practice_set_id=?
              AND a.selected_option_id IS NOT NULL
            """, Integer.class,userId,setId,setId);
        return n==null?0:n;
    }

    public long createAttempt(long userId,long setId,int correct,int total,double percent) {
        var holder=new GeneratedKeyHolder();
        jdbc.update(connection -> {
            var statement=connection.prepareStatement("""
                INSERT INTO practice_attempts
                  (user_id,practice_set_id,correct_count,total_questions,score_percent,started_at,submitted_at)
                VALUES(?,?,?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)
                """,Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1,userId);statement.setLong(2,setId);statement.setInt(3,correct);
            statement.setInt(4,total);statement.setDouble(5,percent);
            return statement;
        },holder);
        return Objects.requireNonNull(holder.getKey(),"Missing attempt primary key").longValue();
    }

    public void saveAnswer(long attemptId,long questionId,Long optionId,boolean correct) {
        jdbc.update("""
            INSERT INTO practice_attempt_answers
                (attempt_id,question_id,selected_option_id,is_correct) VALUES(?,?,?,?)
            """,attemptId,questionId,optionId,correct);
    }

    /** Locks the user row before starting to prevent duplicate open attempts across browser tabs. */
    public void lockUser(long userId) {
        jdbc.queryForList("SELECT id FROM users WHERE id=? FOR UPDATE", userId);
    }

    public Optional<Long> activeAttempt(long userId, long setId) {
        return jdbc.query("""
            SELECT id FROM practice_attempts
            WHERE user_id=? AND practice_set_id=? AND submitted_at IS NULL
            ORDER BY id DESC LIMIT 1
            """, (rs,i)->rs.getLong("id"), userId, setId).stream().findFirst();
    }

    /**
     * Explicit retake: end any unfinished sessions so they cannot be accidentally
     * resumed after the new attempt is completed. Existing answers stay in MySQL.
     */
    public void closeOpenAttempts(long userId,long setId) {
        jdbc.update("""
            UPDATE practice_attempts
            SET submitted_at=CURRENT_TIMESTAMP
            WHERE user_id=? AND practice_set_id=? AND submitted_at IS NULL
            """,userId,setId);
    }

    public Optional<Map<String,Object>> latestAttempt(long userId,long setId) {
        return jdbc.queryForList("""
            SELECT id,total_questions,submitted_at,correct_count FROM practice_attempts
            WHERE user_id=? AND practice_set_id=? ORDER BY id DESC LIMIT 1
            """, userId,setId).stream().findFirst();
    }

    public long createOpenAttempt(long userId, long setId, int count) {
        var keys=new GeneratedKeyHolder();
        jdbc.update(connection -> {
            var statement=connection.prepareStatement("""
                INSERT INTO practice_attempts (user_id,practice_set_id,total_questions,
                    correct_count,score_percent,started_at,submitted_at)
                VALUES(?,?,?,0,0,CURRENT_TIMESTAMP,NULL)
                """, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1,userId);statement.setLong(2,setId);statement.setInt(3,count);
            return statement;
        }, keys);
        return Objects.requireNonNull(keys.getKey(), "Missing attempt primary key").longValue();
    }

    /** Lock by user AND practice set: no caller can read another user's attempts. */
    public Optional<Map<String,Object>> lockedAttempt(long id, long userId, long setId) {
        return jdbc.queryForList("""
            SELECT id,total_questions,submitted_at FROM practice_attempts
            WHERE id=? AND user_id=? AND practice_set_id=? FOR UPDATE
            """, id,userId,setId).stream().findFirst();
    }

    public List<Map<String,Object>> checkedAnswers(long attemptId) {
        return jdbc.queryForList("""
            SELECT question_id,selected_option_id,is_correct
            FROM practice_attempt_answers WHERE attempt_id=? ORDER BY id
            """, attemptId);
    }

    public void refreshAttempt(long attemptId,int total) {
        var rows=jdbc.queryForList("""
            SELECT COUNT(*) AS answered,COALESCE(SUM(is_correct),0) AS correct_count
            FROM practice_attempt_answers WHERE attempt_id=?
            """,attemptId);
        int answered=((Number)rows.get(0).get("answered")).intValue();
        int correct=((Number)rows.get(0).get("correct_count")).intValue();
        if(answered>total) throw new IllegalStateException("Invalid answer count");
        double score=total==0?0:Math.round((10000.0*correct)/total)/100.0;
        jdbc.update("""
            UPDATE practice_attempts
            SET correct_count=?,score_percent=?,
                submitted_at=CASE WHEN ? >= ? THEN COALESCE(submitted_at,CURRENT_TIMESTAMP) ELSE NULL END
            WHERE id=?
            """,correct,score,answered,total,attemptId);
    }

    public List<Map<String,Object>> history(long userId) {
        return jdbc.queryForList("""
            SELECT a.id, s.id AS set_id, s.part_no, s.title, s.instructions, a.correct_count, a.total_questions,
                   a.score_percent, a.submitted_at,
                   (SELECT COUNT(*) FROM practice_attempt_answers aa
                    WHERE aa.attempt_id=a.id AND aa.selected_option_id IS NOT NULL)
                    AS answered_count
            FROM practice_attempts a
            JOIN practice_sets s ON s.id=a.practice_set_id
            WHERE a.user_id=? AND s.skill='LISTENING' AND s.is_published=1
              AND s.instructions LIKE '%[LISTENING_LEVEL:%' AND a.submitted_at IS NOT NULL
              AND EXISTS(SELECT 1 FROM practice_attempt_answers aa
                         WHERE aa.attempt_id=a.id AND aa.selected_option_id IS NOT NULL)
            ORDER BY a.id DESC LIMIT 15
            """,userId);
    }
}
