package com.toeic.nhom11.reading.admin;

import java.util.*;
import java.util.regex.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tools.jackson.databind.json.JsonMapper;

/** Admin-side Reading CRUD. Shares practice_* with the existing student Reading services. */
@Service
public class ReadingAdminService {
    private final JdbcTemplate jdbc;
    private final JsonMapper json = JsonMapper.builder().build();
    private static final Pattern LEVEL = Pattern.compile("\\[READING_PART([567])_LEVEL:([1-5])\\]");
    private static final Pattern PREFIX = Pattern.compile("^\\[READING_PART[567]_LEVEL:[1-5]\\]\\s*");
    private static final List<String> LABELS = List.of("A", "B", "C", "D");

    public ReadingAdminService(JdbcTemplate jdbc) { this.jdbc = jdbc; }

    private static long number(Object value) { return ((Number)value).longValue(); }
    private static boolean yes(Object value) {
        return Boolean.TRUE.equals(value) || (value instanceof Number n && n.intValue() != 0);
    }
    private static String required(String s, String what, int max) {
        String text = s == null ? "" : s.trim();
        if (text.isEmpty() || text.length() > max) throw new IllegalArgumentException(what + " phải có nội dung, tối đa " + max + " ký tự.");
        return text;
    }
    private static String optional(String s, int max) {
        String text = s == null ? "" : s.trim();
        if (text.length() > max) throw new IllegalArgumentException("Nội dung vượt quá " + max + " ký tự.");
        return text;
    }
    private static void validPart(int part) {
        if (part < 5 || part > 7) throw new IllegalArgumentException("Reading chỉ có Part 5, 6, 7.");
    }
    private static int validLevel(int level) {
        if (level < 1 || level > 5) throw new IllegalArgumentException("Cấp độ phải từ 1 đến 5.");
        return level;
    }
    private static int levelOf(Object raw) {
        Matcher m = LEVEL.matcher(Objects.toString(raw, ""));
        return m.find() ? Integer.parseInt(m.group(2)) : 0;
    }
    private static String levelToken(int part, int level) { return "[READING_PART" + part + "_LEVEL:" + level + "]"; }
    private long count(String sql, Object... params) {
        Long val = jdbc.queryForObject(sql, Long.class, params);
        return val == null ? 0L : val;
    }
    private long insert(String sql, Object... values) {
        GeneratedKeyHolder holder = new GeneratedKeyHolder();
        jdbc.update(conn -> {
            var statement = conn.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < values.length; i++) statement.setObject(i + 1, values[i]);
            return statement;
        }, holder);
        return Objects.requireNonNull(holder.getKey(), "Missing generated primary key").longValue();
    }

    public List<Map<String,Object>> sets(Integer part) {
        if (part != null) validPart(part);
        String sql = """
            SELECT s.*, (SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=s.id) AS question_count,
             (SELECT COUNT(*) FROM practice_passages p WHERE p.practice_set_id=s.id) AS passage_count,
             (SELECT COUNT(*) FROM practice_attempts a WHERE a.practice_set_id=s.id) AS attempt_count
            FROM practice_sets s WHERE s.skill='READING'
            """ + (part == null ? "" : " AND s.part_no=?") + " ORDER BY s.part_no, s.id DESC";
        List<Map<String,Object>> data = part == null ? jdbc.queryForList(sql) : jdbc.queryForList(sql, part);
        for (var s : data) s.put("level", levelOf(s.get("instructions")));
        return data;
    }
    public Map<String,Object> set(long id) {
        var result = jdbc.queryForList("""
            SELECT s.*, (SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=s.id) AS question_count,
             (SELECT COUNT(*) FROM practice_attempts a WHERE a.practice_set_id=s.id) AS attempt_count
            FROM practice_sets s WHERE s.skill='READING' AND s.id=?
            """, id).stream().findFirst().orElseThrow(() -> new IllegalArgumentException("Không tìm thấy bộ Reading."));
        result.put("level", levelOf(result.get("instructions")));
        result.put("instructions_clean", PREFIX.matcher(Objects.toString(result.get("instructions"), "")).replaceFirst(""));
        return result;
    }
    private void lockExamSource(long id) { jdbc.queryForList("SELECT id FROM practice_sets WHERE id=? FOR UPDATE",id); }
    private void checkExamSource(long id) { if(!jdbc.queryForList("SELECT x.id FROM exam_paper_questions x JOIN practice_questions q ON q.id=x.question_id WHERE q.practice_set_id=? FOR UPDATE",id).isEmpty()) throw new IllegalArgumentException("Bộ luyện đang được dùng trong đề thi. Hãy bỏ liên kết khỏi đề nháp trước khi sửa hoặc ẩn bộ."); }
    private void editable(long id) {
        lockExamSource(id); // N11 V33 source lock
        var set = set(id);
        if (yes(set.get("is_published"))) throw new IllegalArgumentException("Hãy ẩn bộ Reading trước khi chỉnh sửa.");
        if (number(set.get("attempt_count")) > 0) throw new IllegalArgumentException("Bộ đã có lượt làm bài; không thể sửa nội dung để bảo toàn lịch sử chấm điểm.");
        checkExamSource(id); // N11 V33 source guard
    }
    private long adminId(String email) {
        if (email == null) throw new IllegalArgumentException("Cần đăng nhập tài khoản Admin.");
        return jdbc.query("SELECT id FROM users WHERE email=? AND role='ADMIN' AND status='ACTIVE'",
            (rs,row) -> rs.getLong(1), email.toLowerCase(Locale.ROOT).trim())
            .stream().findFirst().orElseThrow(() -> new IllegalArgumentException("Tài khoản Admin không hợp lệ."));
    }

    @Transactional
    public long saveSet(Long id, int part, int level, String title, String instructions, String difficulty, String email) {
        validPart(part); if (level != 0) validLevel(level); // V20_ALLOW_UNCLASSIFIED
        title = required(title, "Tên bộ Reading", 200);
        String clean = PREFIX.matcher(optional(instructions, 3000)).replaceFirst("");
        String tagged = level == 0 ? clean : levelToken(part,level) + (clean.isEmpty() ? "" : " " + clean);
        if (!Set.of("EASY","MEDIUM","HARD").contains(difficulty)) throw new IllegalArgumentException("Độ khó không hợp lệ.");
        if (id == null) {
            return insert("INSERT INTO practice_sets(skill,part_no,title,instructions,difficulty,is_published,created_by) VALUES('READING',?,?,?,?,0,?)",
                part,title,tagged,difficulty,adminId(email));
        }
        editable(id);
        jdbc.update("UPDATE practice_sets SET part_no=?,title=?,instructions=?,difficulty=? WHERE id=? AND skill='READING'",
            part,title,tagged,difficulty,id);
        return id;
    }

    @Transactional
    public void publish(long id, boolean published) {
        lockExamSource(id); // N11 V33 publication lock
        if(!published) checkExamSource(id);
        var set = set(id);
        if (published) {
            int part = ((Number)set.get("part_no")).intValue();
            int level = levelOf(set.get("instructions"));
            if (level > 0 && !Objects.toString(set.get("instructions"), "").startsWith(levelToken(part,level))) level = 0;
            if (level == 0) throw new IllegalArgumentException("Bộ Reading chưa có cấp độ 1–5. Hãy sửa bộ trước khi công bố.");
            if (count("SELECT COUNT(*) FROM practice_sets WHERE skill='READING' AND part_no=? AND is_published=1 AND id<>? AND instructions LIKE ?",
                    part,id,levelToken(part,level) + "%") > 0)
                throw new IllegalArgumentException("Đã có bộ được công bố ở Part " + part + ", cấp " + level + ". Hãy ẩn bộ kia trước.");
            long questions = count("SELECT COUNT(*) FROM practice_questions WHERE practice_set_id=?", id);
            if (questions == 0) throw new IllegalArgumentException("Cần ít nhất một câu hỏi trước khi công bố.");
            long invalid = count("""
                SELECT COUNT(*) FROM practice_questions q WHERE q.practice_set_id=? AND
                  ((SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id)<>4 OR
                   (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id AND o.is_correct=1)<>1 OR
                   (SELECT COUNT(DISTINCT o.option_label) FROM practice_options o WHERE o.question_id=q.id)<>4)
                """, id);
            if (invalid > 0) throw new IllegalArgumentException("Có " + invalid + " câu thiếu 4 đáp án hoặc chưa có đúng một đáp án chính xác.");
            if (part >= 6) {
                var groups = jdbc.queryForList("""
                    SELECT p.id, COUNT(q.id) AS n FROM practice_passages p
                    LEFT JOIN practice_questions q ON q.passage_id=p.id AND q.practice_set_id=p.practice_set_id
                    WHERE p.practice_set_id=? GROUP BY p.id
                    """, id);
                if (groups.isEmpty()) throw new IllegalArgumentException("Part 6–7 cần ít nhất một đoạn đọc.");
                long groupQuestions = 0;
                for (var g : groups) {
                    long n = number(g.get("n")); groupQuestions += n;
                    if (part == 6 && n != 4) throw new IllegalArgumentException("Part 6: mỗi đoạn phải có đúng 4 câu hỏi.");
                    if (part == 7 && (n < 2 || n > 5)) throw new IllegalArgumentException("Part 7: mỗi đoạn phải có từ 2 đến 5 câu hỏi.");
                }
                if (groupQuestions != questions) throw new IllegalArgumentException("Có câu hỏi chưa gắn với đoạn đọc.");
            }
        }
        jdbc.update("UPDATE practice_sets SET is_published=? WHERE id=? AND skill='READING'",published,id);
    }

    @Transactional
    public void deleteSet(long id) {
        editable(id);
        if (count("SELECT COUNT(*) FROM practice_questions WHERE practice_set_id=?",id)>0 ||
            count("SELECT COUNT(*) FROM practice_passages WHERE practice_set_id=?",id)>0)
            throw new IllegalArgumentException("Chỉ xóa bộ nháp trống. Hãy xóa câu hỏi và đoạn đọc trước.");
        jdbc.update("DELETE FROM practice_sets WHERE skill='READING' AND id=?",id);
    }

    public List<Map<String,Object>> passages(long setId) {
        set(setId);
        var result = jdbc.queryForList("SELECT id,practice_set_id,passage_text,sort_order FROM practice_passages WHERE practice_set_id=? ORDER BY sort_order,id",setId);
        for (var row : result) {
            String content = Objects.toString(row.get("passage_text"),"");
            String title = "", body = "";
            try {
                @SuppressWarnings("unchecked") Map<String,Object> decoded = json.readValue(content, Map.class);
                title = Objects.toString(decoded.get("title"), "");
                Object lines = decoded.get("lines");
                if (!(lines instanceof List<?>)) {
                    Object docs=decoded.get("documents");
                    if (docs instanceof List<?> documents && !documents.isEmpty() && documents.get(0) instanceof Map<?,?> m) lines=m.get("lines");
                }
                if (lines instanceof List<?> list) {
                    var strings = new ArrayList<String>();
                    for (Object item : list) if (item instanceof Map<?,?> m) strings.add(Objects.toString(m.get("en"),""));
                    body = String.join("\n",strings);
                }
            } catch (Exception ignored) { body = content; }
            row.put("title",title); row.put("body",body);
        }
        return result;
    }
    private void passageBelongs(long setId,long passageId) {
        if(count("SELECT COUNT(*) FROM practice_passages WHERE id=? AND practice_set_id=?",passageId,setId)==0)
            throw new IllegalArgumentException("Đoạn đọc không thuộc bộ này.");
    }
    @Transactional
    public void savePassage(long setId, Long passageId, String title, String text, int sort) {
        editable(setId);
        int part = ((Number)set(setId).get("part_no")).intValue();
        if(part==5) throw new IllegalArgumentException("Part 5 không sử dụng đoạn đọc.");
        if (sort < 0) throw new IllegalArgumentException("Thứ tự không hợp lệ.");
        title=required(title,"Tiêu đề đoạn đọc",200);
        text=required(text,"Nội dung đoạn đọc",15000);
        var lines = new ArrayList<Map<String,String>>();
        for (String line : text.split("\\R")) if (!line.isBlank()) lines.add(Map.of("en",line.trim(),"vi",""));
        if (lines.isEmpty()) throw new IllegalArgumentException("Cần ít nhất một dòng tiếng Anh.");
        Map<String,Object> value = new LinkedHashMap<>();value.put("title",title);
        if (part==6) value.put("lines",lines);
        else value.put("documents",List.of(Map.of("title",title,"title_vi","","lines",lines)));
        value.put("glossary",Map.of());
        String saved;
        try { saved=json.writeValueAsString(value); }
        catch (Exception ex) { throw new IllegalArgumentException("Không thể mã hóa nội dung đoạn đọc.",ex); }
        if(passageId==null) insert("INSERT INTO practice_passages(practice_set_id,passage_text,sort_order) VALUES(?,?,?)",setId,saved,sort);
        else {
            passageBelongs(setId,passageId);
            jdbc.update("UPDATE practice_passages SET passage_text=?,sort_order=? WHERE id=? AND practice_set_id=?",saved,sort,passageId,setId);
        }
    }
    @Transactional
    public void deletePassage(long setId,long id) {
        editable(setId);passageBelongs(setId,id);
        if(count("SELECT COUNT(*) FROM practice_questions WHERE passage_id=?",id)>0)
            throw new IllegalArgumentException("Đoạn đang có câu hỏi. Hãy xóa câu hỏi trước.");
        jdbc.update("DELETE FROM practice_passages WHERE id=? AND practice_set_id=?",id,setId);
    }

    public List<Map<String,Object>> questions(long setId) {
        set(setId);
        return jdbc.queryForList("""
            SELECT q.*, (SELECT o.option_label FROM practice_options o WHERE o.question_id=q.id AND o.is_correct=1 LIMIT 1) AS correct_label
            FROM practice_questions q WHERE q.practice_set_id=? ORDER BY q.sort_order,q.id
            """,setId);
    }
    public Map<String,Object> question(long setId,long questionId) {
        set(setId);
        var result=jdbc.queryForList("SELECT * FROM practice_questions WHERE id=? AND practice_set_id=?",questionId,setId)
            .stream().findFirst().orElseThrow(() -> new IllegalArgumentException("Không tìm thấy câu hỏi."));
        var opts=jdbc.queryForList("SELECT option_label,option_text,is_correct FROM practice_options WHERE question_id=?",questionId);
        for (var o : opts) {
            result.put("option"+o.get("option_label"),o.get("option_text"));
            if(yes(o.get("is_correct"))) result.put("correctLabel",o.get("option_label"));
        }
        return result;
    }
    @Transactional
    public long saveQuestion(long setId,Long id,Long passageId,String prompt,String explanation,int sort,
                             String a,String b,String c,String d,String correct) {
        editable(setId);
        int part=((Number)set(setId).get("part_no")).intValue();
        if(sort<0) throw new IllegalArgumentException("Thứ tự không hợp lệ.");
        prompt=required(prompt,"Câu hỏi",30000);
        explanation=optional(explanation,30000);
        if(part==5) passageId=null;
        else {
            if(passageId==null) throw new IllegalArgumentException("Part 6–7 cần chọn đoạn đọc cho câu hỏi.");
            passageBelongs(setId,passageId);
        }
        List<String> options=List.of(required(a,"Đáp án A",30000),required(b,"Đáp án B",30000),
                                    required(c,"Đáp án C",30000),required(d,"Đáp án D",30000));
        if(!LABELS.contains(correct)) throw new IllegalArgumentException("Đáp án đúng phải là A, B, C hoặc D.");
        if(id==null) id=insert("""
            INSERT INTO practice_questions(practice_set_id,passage_id,question_text,explanation,sort_order)
            VALUES(?,?,?,?,?)
            """,setId,passageId,prompt,explanation,sort);
        else {
            question(setId,id);
            jdbc.update("UPDATE practice_questions SET passage_id=?,question_text=?,explanation=?,sort_order=? WHERE id=? AND practice_set_id=?",
                passageId,prompt,explanation,sort,id,setId);
            jdbc.update("DELETE FROM practice_options WHERE question_id=?",id);
        }
        for(int i=0;i<4;i++) insert("INSERT INTO practice_options(question_id,option_label,option_text,is_correct) VALUES(?,?,?,?)",
            id,LABELS.get(i),options.get(i),LABELS.get(i).equals(correct));
        return id;
    }
    @Transactional
    public void deleteQuestion(long setId,long id) {
        editable(setId);question(setId,id);
        jdbc.update("DELETE FROM practice_options WHERE question_id=?",id);
        jdbc.update("DELETE FROM practice_questions WHERE id=? AND practice_set_id=?",id,setId);
    }
}
