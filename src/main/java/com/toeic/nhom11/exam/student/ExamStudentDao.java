package com.toeic.nhom11.exam.student;

import java.sql.Statement;
import java.util.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

/** Student-only exam persistence. Admin manages exam_papers and exam_paper_questions. */
@Repository
public class ExamStudentDao {
    private final JdbcTemplate jdbc;
    public ExamStudentDao(JdbcTemplate jdbc) { this.jdbc = jdbc; }

    public List<Map<String,Object>> publishedPapers() {
        return jdbc.queryForList("""
            SELECT p.id, p.title, p.description, p.exam_type AS examType,
                   p.duration_minutes AS durationMinutes,
                   COUNT(epq.id) AS questionCount,
                   COALESCE(SUM(CASE WHEN s.skill='LISTENING' THEN 1 ELSE 0 END),0) AS listeningCount,
                   COALESCE(SUM(CASE WHEN s.skill='READING' THEN 1 ELSE 0 END),0) AS readingCount
            FROM exam_papers p
            LEFT JOIN exam_paper_questions epq ON epq.exam_paper_id=p.id
            LEFT JOIN practice_questions q ON q.id=epq.question_id
            LEFT JOIN practice_sets s ON s.id=q.practice_set_id
            WHERE p.is_published=1
            GROUP BY p.id, p.title, p.description, p.exam_type, p.duration_minutes
            ORDER BY p.id DESC
            """);
    }

    public Optional<Map<String,Object>> publishedPaper(long id) {
        return jdbc.queryForList("""
            SELECT id, title, description, exam_type AS examType,
                   duration_minutes AS durationMinutes
            FROM exam_papers WHERE id=? AND is_published=1
            """, id).stream().findFirst();
    }

    /** This read intentionally does not return correct-answer flags. */
    public List<Map<String,Object>> questionRows(long paperId) {
        return jdbc.queryForList("""
            SELECT epq.id AS examQuestionId, epq.question_order AS questionOrder,
                   q.id AS questionId, q.question_text AS questionText,
                   q.explanation AS explanation, s.skill, s.part_no AS partNo,
                   ps.id AS passageId, ps.passage_text AS passageText,
                   CASE WHEN s.part_no IN (3,4)
                        THEN COALESCE(NULLIF(psAudio.file_url,''), qAudio.file_url)
                        ELSE COALESCE(NULLIF(qAudio.file_url,''), psAudio.file_url) END AS audioUrl,
                   qImage.file_url AS imageUrl, psImage.file_url AS passageImageUrl
            FROM exam_paper_questions epq
            JOIN practice_questions q ON q.id=epq.question_id
            JOIN practice_sets s ON s.id=q.practice_set_id
            LEFT JOIN practice_passages ps ON ps.id=q.passage_id AND ps.practice_set_id=q.practice_set_id
            LEFT JOIN media_assets qAudio ON qAudio.id=q.audio_media_id AND qAudio.media_type='AUDIO'
            LEFT JOIN media_assets psAudio ON psAudio.id=ps.audio_media_id AND psAudio.media_type='AUDIO'
            LEFT JOIN media_assets qImage ON qImage.id=q.image_media_id AND qImage.media_type='IMAGE'
            LEFT JOIN media_assets psImage ON psImage.id=ps.image_media_id AND psImage.media_type='IMAGE'
            WHERE epq.exam_paper_id=?
            ORDER BY epq.question_order,epq.id
            """, paperId);
    }

    public List<Map<String,Object>> optionRows(long paperId) {
        return jdbc.queryForList("""
            SELECT epq.id AS examQuestionId, o.id AS optionId,
                   o.option_label AS optionLabel, o.option_text AS optionText
            FROM exam_paper_questions epq
            JOIN practice_options o ON o.question_id=epq.question_id
            WHERE epq.exam_paper_id=?
            ORDER BY epq.question_order, o.option_label
            """, paperId);
    }

    public List<Map<String,Object>> optionQuality(long paperId) {
        return jdbc.queryForList("""
            SELECT epq.id AS examQuestionId, COUNT(o.id) AS optionCount,
                   COALESCE(SUM(CASE WHEN o.is_correct=1 THEN 1 ELSE 0 END),0) AS correctCount
            FROM exam_paper_questions epq
            LEFT JOIN practice_options o ON o.question_id=epq.question_id
            WHERE epq.exam_paper_id=?
            GROUP BY epq.id
            """, paperId);
    }

    public Optional<Long> activeUser(String email) {
        return jdbc.query("SELECT id FROM users WHERE email=? AND status='ACTIVE'",
                (rs,i)->rs.getLong(1),email).stream().findFirst();
    }

    /** Lock the student before creating/resuming an attempt to avoid double-click races. */
    public void lockUser(long userId) {
        jdbc.queryForList("SELECT id FROM users WHERE id=? FOR UPDATE",userId);
    }

    /** Returns the skill associated with one paper question, without exposing the answer. */
    public Optional<String> questionSkill(long paperId,long examQuestionId) {
        return jdbc.query("""
            SELECT s.skill FROM exam_paper_questions epq
            JOIN practice_questions q ON q.id=epq.question_id
            JOIN practice_sets s ON s.id=q.practice_set_id
            WHERE epq.exam_paper_id=? AND epq.id=?
            """,(rs,i)->rs.getString(1),paperId,examQuestionId).stream().findFirst();
    }

    public List<Long> inProgressAttempts(long paperId,long userId) {
        return jdbc.query("""
            SELECT id FROM exam_attempts
            WHERE exam_paper_id=? AND user_id=? AND status='IN_PROGRESS'
            ORDER BY id DESC
            """, (rs,i)->rs.getLong(1),paperId,userId);
    }

    public long insertAttempt(long paperId,long userId) {
        var keys = new GeneratedKeyHolder();
        jdbc.update(con -> {
            var ps=con.prepareStatement("""
                INSERT INTO exam_attempts (exam_paper_id,user_id,status,started_at)
                VALUES (?,?,'IN_PROGRESS',NOW())
                """,Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1,paperId); ps.setLong(2,userId); return ps;
        },keys);
        if(keys.getKey()==null) throw new IllegalStateException("Không lấy được mã lượt thi.");
        return keys.getKey().longValue();
    }

    /** The FOR UPDATE variant must be called in a Spring transaction. */
    public Optional<Map<String,Object>> ownedAttempt(long attemptId,String email,boolean lock) {
        String sql="""
            SELECT a.id,a.exam_paper_id AS examPaperId,a.user_id AS userId,
                   a.status,a.started_at AS startedAt,a.submitted_at AS submittedAt,
                   a.listening_correct AS listeningCorrect,a.reading_correct AS readingCorrect,
                   a.listening_scaled AS listeningScaled,a.reading_scaled AS readingScaled,
                   a.total_scaled AS totalScaled,
                   p.title,p.exam_type AS examType,p.duration_minutes AS durationMinutes,
                   TIMESTAMPDIFF(SECOND,a.started_at,NOW()) AS elapsedSeconds,
                   TIMESTAMPDIFF(SECOND,NOW(),DATE_ADD(a.started_at,INTERVAL p.duration_minutes MINUTE))
                       AS remainingSeconds
            FROM exam_attempts a
            JOIN exam_papers p ON p.id=a.exam_paper_id
            JOIN users u ON u.id=a.user_id
            WHERE a.id=? AND u.email=?
            """ + (lock ? " FOR UPDATE" : "");
        return jdbc.queryForList(sql,attemptId,email).stream().findFirst();
    }

    public List<Map<String,Object>> answerRows(long attemptId) {
        return jdbc.queryForList("""
            SELECT exam_paper_question_id AS examQuestionId,
                   selected_option_id AS selectedOptionId
            FROM exam_attempt_answers WHERE attempt_id=?
            """,attemptId);
    }

    public boolean optionBelongs(long paperId,long examQuestionId,long optionId) {
        Integer n=jdbc.queryForObject("""
            SELECT COUNT(*) FROM exam_paper_questions epq
            JOIN practice_options o ON o.question_id=epq.question_id
            WHERE epq.exam_paper_id=? AND epq.id=? AND o.id=?
            """,Integer.class,paperId,examQuestionId,optionId);
        return n!=null && n==1;
    }

    public boolean questionBelongs(long paperId,long examQuestionId) {
        Integer n=jdbc.queryForObject("""
            SELECT COUNT(*) FROM exam_paper_questions WHERE exam_paper_id=? AND id=?
            """,Integer.class,paperId,examQuestionId);
        return n!=null && n==1;
    }

    public void saveAnswer(long attemptId,long examQuestionId,Long optionId) {
        if(optionId==null) {
            jdbc.update("DELETE FROM exam_attempt_answers WHERE attempt_id=? AND exam_paper_question_id=?",
                attemptId,examQuestionId);
        } else {
            jdbc.update("""
                INSERT INTO exam_attempt_answers
                    (attempt_id,exam_paper_question_id,selected_option_id,is_correct)
                VALUES (?,?,?,NULL)
                ON DUPLICATE KEY UPDATE selected_option_id=?,is_correct=NULL
                """,attemptId,examQuestionId,optionId,optionId);
        }
    }

    /** Recalculate correctness against the server-side answer key, not the browser. */
    public Map<String,Integer> gradeAnswers(long attemptId) {
        List<Map<String,Object>> rows=jdbc.queryForList("""
            SELECT a.id AS answerId, s.skill,
                   CASE WHEN o.is_correct=1 THEN 1 ELSE 0 END AS accurate
            FROM exam_attempt_answers a
            JOIN exam_paper_questions epq ON epq.id=a.exam_paper_question_id
            JOIN practice_questions q ON q.id=epq.question_id
            JOIN practice_sets s ON s.id=q.practice_set_id
            JOIN practice_options o ON o.id=a.selected_option_id AND o.question_id=q.id
            WHERE a.attempt_id=?
            """,attemptId);
        Map<String,Integer> counts=new HashMap<>();
        counts.put("LISTENING",0); counts.put("READING",0);
        for(var row:rows) {
            boolean correct=((Number)row.get("accurate")).intValue()==1;
            jdbc.update("UPDATE exam_attempt_answers SET is_correct=? WHERE id=?",
                correct,((Number)row.get("answerId")).longValue());
            if(correct) counts.merge(Objects.toString(row.get("skill")),1,Integer::sum);
        }
        return counts;
    }

    public Integer scaledScore(long paperId,String skill,int correct) {
        return jdbc.query("""
            SELECT scaled_score FROM exam_score_scales
            WHERE exam_paper_id=? AND skill=? AND raw_correct=?
            """,(rs,i)->rs.getInt(1),paperId,skill,correct).stream().findFirst().orElse(null);
    }

    public void finishAttempt(long id,String status,int listening,int reading,
                              Integer scaledListening,Integer scaledReading,Integer scaledTotal) {
        jdbc.update("""
            UPDATE exam_attempts SET status=?,submitted_at=NOW(),
                listening_correct=?,reading_correct=?,listening_scaled=?,reading_scaled=?,total_scaled=?
            WHERE id=? AND status='IN_PROGRESS'
            """,status,listening,reading,scaledListening,scaledReading,scaledTotal,id);
    }

    public List<Map<String,Object>> history(long userId) {
        return jdbc.queryForList("""
            SELECT a.id,p.title,p.exam_type AS examType,a.status,
                   a.started_at AS startedAt,a.submitted_at AS submittedAt,
                   a.listening_correct AS listeningCorrect,a.reading_correct AS readingCorrect,
                   a.listening_scaled AS listeningScaled,a.reading_scaled AS readingScaled,
                   a.total_scaled AS totalScaled,
                   TIMESTAMPDIFF(SECOND,NOW(),DATE_ADD(a.started_at,INTERVAL p.duration_minutes MINUTE)) AS remainingSeconds
            FROM exam_attempts a JOIN exam_papers p ON p.id=a.exam_paper_id
            WHERE a.user_id=? ORDER BY a.id DESC LIMIT 100
            """,userId);
    }

    /** Correct option flags may ONLY be read after service.result verifies submission. */
    public List<Map<String,Object>> reviewChoices(long paperId) {
        return jdbc.queryForList("""
            SELECT epq.id AS examQuestionId, o.id AS optionId,
                   o.option_label AS optionLabel, o.option_text AS optionText,
                   o.is_correct AS correct
            FROM exam_paper_questions epq
            JOIN practice_options o ON o.question_id=epq.question_id
            WHERE epq.exam_paper_id=? ORDER BY epq.question_order,o.option_label
            """,paperId);
    }

    public List<Map<String,Object>> reviewAnswers(long attemptId) {
        return jdbc.queryForList("""
            SELECT epq.id AS examQuestionId, a.selected_option_id AS selectedOptionId,
                   so.option_label AS selectedLabel,co.option_label AS correctLabel,
                   COALESCE(a.is_correct,0) AS isCorrect
            FROM exam_paper_questions epq
            JOIN exam_attempts ea ON ea.exam_paper_id=epq.exam_paper_id
            LEFT JOIN exam_attempt_answers a
              ON a.attempt_id=ea.id AND a.exam_paper_question_id=epq.id
            LEFT JOIN practice_options so ON so.id=a.selected_option_id
            LEFT JOIN practice_options co
              ON co.question_id=epq.question_id AND co.is_correct=1
            WHERE ea.id=?
            ORDER BY epq.question_order
            """,attemptId);
    }
}
