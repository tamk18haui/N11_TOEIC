package com.toeic.nhom11.listening.admin;

import java.sql.PreparedStatement;
import java.util.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

/** Only operates on LISTENING sets. The Reading module shares the same tables. */
@Repository
public class ListeningAdminDao {
    private final JdbcTemplate jdbc;

    public ListeningAdminDao(JdbcTemplate jdbc) { this.jdbc = jdbc; }

    private long insert(String sql, Object... params) {
        var key = new GeneratedKeyHolder();
        jdbc.update(con -> {
            PreparedStatement st = con.prepareStatement(sql, new String[] {"id"});
            for (int i = 0; i < params.length; i++) st.setObject(i + 1, params[i]);
            return st;
        }, key);
        return Objects.requireNonNull(key.getKey(), "Missing generated ID").longValue();
    }

    public List<Map<String,Object>> sets(Integer part) {
        String sql = """
            SELECT s.*, (SELECT COUNT(*) FROM practice_passages p WHERE p.practice_set_id=s.id) AS passage_count,
              (SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=s.id) AS question_count,
              (SELECT COUNT(*) FROM practice_attempts a WHERE a.practice_set_id=s.id) AS attempt_count
            FROM practice_sets s WHERE s.skill='LISTENING'
            """;
        if (part != null) return jdbc.queryForList(sql + " AND s.part_no=? ORDER BY s.id DESC", part);
        return jdbc.queryForList(sql + " ORDER BY s.part_no, s.id DESC");
    }

    public Optional<Map<String,Object>> set(long id) {
        return jdbc.queryForList("""
             SELECT s.*, (SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=s.id) AS question_count,
             (SELECT COUNT(*) FROM practice_attempts a WHERE a.practice_set_id=s.id) AS attempt_count
             FROM practice_sets s WHERE s.id=? AND s.skill='LISTENING'
             """, id).stream().findFirst();
    }

    public List<Map<String,Object>> passages(long setId) {
        return jdbc.queryForList("""
            SELECT p.*, a.file_url AS audio_url, i.file_url AS image_url
            FROM practice_passages p
            LEFT JOIN media_assets a ON a.id=p.audio_media_id
            LEFT JOIN media_assets i ON i.id=p.image_media_id
            WHERE p.practice_set_id=? ORDER BY p.sort_order,p.id
            """, setId);
    }
    public Optional<Map<String,Object>> passage(long setId, long id) {
        return jdbc.queryForList("SELECT * FROM practice_passages WHERE practice_set_id=? AND id=?",setId,id)
                .stream().findFirst();
    }

    public List<Map<String,Object>> questions(long setId) {
        return jdbc.queryForList("""
            SELECT q.*, a.file_url AS audio_url, i.file_url AS image_url,
             (SELECT o.option_text FROM practice_options o WHERE o.question_id=q.id AND o.option_label='A' LIMIT 1) AS option_a,
             (SELECT o.option_text FROM practice_options o WHERE o.question_id=q.id AND o.option_label='B' LIMIT 1) AS option_b,
             (SELECT o.option_text FROM practice_options o WHERE o.question_id=q.id AND o.option_label='C' LIMIT 1) AS option_c,
             (SELECT o.option_text FROM practice_options o WHERE o.question_id=q.id AND o.option_label='D' LIMIT 1) AS option_d,
             (SELECT o.option_label FROM practice_options o WHERE o.question_id=q.id AND o.is_correct=1 LIMIT 1) AS correct_label,
             (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id) AS option_count
            FROM practice_questions q
            LEFT JOIN practice_passages p ON p.id=q.passage_id
            LEFT JOIN media_assets a ON a.id=COALESCE(q.audio_media_id,p.audio_media_id)
            LEFT JOIN media_assets i ON i.id=COALESCE(q.image_media_id,p.image_media_id)
            WHERE q.practice_set_id=? ORDER BY q.sort_order,q.id
            """, setId);
    }
    public Optional<Map<String,Object>> question(long setId, long id) {
        return jdbc.queryForList("SELECT * FROM practice_questions WHERE practice_set_id=? AND id=?",setId,id)
                .stream().findFirst();
    }
    public List<Map<String,Object>> options(long questionId) {
        return jdbc.queryForList("SELECT * FROM practice_options WHERE question_id=? ORDER BY option_label",questionId);
    }

    public long adminId(String email) {
        if (email == null) throw new IllegalArgumentException("Thiếu tài khoản Admin đăng nhập.");
        return jdbc.query("SELECT id FROM users WHERE email=? AND role='ADMIN' AND status='ACTIVE'",
                (rs, index) -> rs.getLong("id"), email.trim().toLowerCase(Locale.ROOT))
                .stream().findFirst().orElseThrow(() -> new IllegalArgumentException("Tài khoản Admin không hợp lệ."));
    }

    public long addSet(int part, String title, String instructions, String difficulty, Long editorId) {
        return insert("""
            INSERT INTO practice_sets(skill,part_no,title,instructions,difficulty,is_published,created_by)
            VALUES('LISTENING',?,?,?,?,0,?)
            """,part,title,instructions,difficulty,editorId);
    }
    public void updateSet(long id, int part, String title, String instructions, String difficulty) {
        jdbc.update("UPDATE practice_sets SET part_no=?,title=?,instructions=?,difficulty=? WHERE id=? AND skill='LISTENING'",
                part,title,instructions,difficulty,id);
    }
    // N11 V33: serialize changes to source bank and protect exam question references.
    public void lockExamSource(long id) {
        jdbc.queryForList("SELECT id FROM practice_sets WHERE id=? FOR UPDATE",id);
    }
    public void checkExamSource(long id) {
        if(!jdbc.queryForList("SELECT x.id FROM exam_paper_questions x JOIN practice_questions q ON q.id=x.question_id WHERE q.practice_set_id=? FOR UPDATE",id).isEmpty()) throw new IllegalArgumentException("Bộ luyện đang được dùng trong đề thi. Hãy bỏ liên kết khỏi đề nháp trước khi sửa hoặc ẩn bộ.");
    }
    public void publish(long id, boolean published) {
        if(!published) checkExamSource(id);
        jdbc.update("UPDATE practice_sets SET is_published=? WHERE id=? AND skill='LISTENING'",published,id);
    }
    public void deleteSet(long id) {
        jdbc.update("DELETE FROM practice_sets WHERE id=? AND skill='LISTENING'",id);
    }

    public void savePassage(Long id, long setId, String transcript, Long audioId, Long imageId, int order) {
        if (id == null) {
            insert("INSERT INTO practice_passages(practice_set_id,passage_text,audio_media_id,image_media_id,sort_order) VALUES(?,?,?,?,?)",
                    setId,transcript,audioId,imageId,order);
        } else {
            jdbc.update("""
                UPDATE practice_passages SET passage_text=?, audio_media_id=?,image_media_id=?,sort_order=?
                WHERE id=? AND practice_set_id=?
                """,transcript,audioId,imageId,order,id,setId);
        }
    }
    public void deletePassage(long setId, long id) {
        jdbc.update("DELETE FROM practice_passages WHERE id=? AND practice_set_id=?",id,setId);
    }

    public long saveQuestion(Long id, long setId, Long passageId, String prompt, String explanation,
                             Long audioId, Long imageId, int order) {
        if (id == null) return insert("""
            INSERT INTO practice_questions(practice_set_id,passage_id,question_text,explanation,audio_media_id,image_media_id,sort_order)
            VALUES(?,?,?,?,?,?,?)
            """,setId,passageId,prompt,explanation,audioId,imageId,order);
        jdbc.update("""
            UPDATE practice_questions SET passage_id=?,question_text=?,explanation=?,audio_media_id=?,image_media_id=?,sort_order=?
            WHERE id=? AND practice_set_id=?
            """,passageId,prompt,explanation,audioId,imageId,order,id,setId);
        return id;
    }
    public void replaceOptions(long questionId, Map<String,String> options, String correct) {
        jdbc.update("DELETE FROM practice_options WHERE question_id=?",questionId);
        for (var entry : options.entrySet()) {
            insert("INSERT INTO practice_options(question_id,option_label,option_text,is_correct) VALUES(?,?,?,?)",
                    questionId,entry.getKey(),entry.getValue(),entry.getKey().equals(correct));
        }
    }
    public void deleteQuestion(long setId, long id) {
        jdbc.update("DELETE FROM practice_options WHERE question_id=?",id);
        jdbc.update("DELETE FROM practice_questions WHERE id=? AND practice_set_id=?",id,setId);
    }

    public long countInvalidQuestions(long setId, int part) {
        Long n = jdbc.queryForObject("""
            SELECT COUNT(*) FROM practice_questions q
            LEFT JOIN practice_passages p ON p.id=q.passage_id
            WHERE q.practice_set_id=? AND (
              (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id) <> (CASE WHEN ? = 2 THEN 3 ELSE 4 END)
              OR (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id AND o.is_correct=1)<>1
              OR (q.audio_media_id IS NULL AND p.audio_media_id IS NULL)
              OR (? = 1 AND q.image_media_id IS NULL AND p.image_media_id IS NULL))
            """,Long.class,setId,part,part);
        return n == null ? 0 : n;
    }
    public long count(long setId, String table) {
        // Only constant table names are accepted; never interpolate client input.
        if (!Set.of("practice_passages","practice_questions","practice_attempts").contains(table))
            throw new IllegalArgumentException("Invalid count table");
        return jdbc.queryForObject("SELECT COUNT(*) FROM " + table + " WHERE practice_set_id=?", Long.class,setId);
    }

    public List<Map<String,Object>> media() {
        return jdbc.queryForList("""
            SELECT * FROM media_assets WHERE (file_url LIKE '/listening-media/%' OR file_url LIKE 'https://res.cloudinary.com/%/listening/%') ORDER BY id DESC
            """);
    }
    public Optional<Map<String,Object>> media(long id) {
        return jdbc.queryForList("SELECT * FROM media_assets WHERE id=? AND (file_url LIKE '/listening-media/%' OR file_url LIKE 'https://res.cloudinary.com/%/listening/%')",id)
                .stream().findFirst();
    }
    public Optional<Map<String,Object>> mediaAny(long id) {
        return jdbc.queryForList("SELECT id,media_type,file_url FROM media_assets WHERE id=?",id).stream().findFirst();
    }
    public long addMedia(String type, String url, String mime, Long duration, Long creator) {
        return insert("INSERT INTO media_assets(media_type,file_url,mime_type,duration_seconds,created_by) VALUES(?,?,?,?,?)",
                type,url,mime,duration,creator);
    }
    public void deleteMedia(long id) {
        jdbc.update("DELETE FROM media_assets WHERE id=? AND (file_url LIKE '/listening-media/%' OR file_url LIKE 'https://res.cloudinary.com/%/listening/%')",id);
    }
}
