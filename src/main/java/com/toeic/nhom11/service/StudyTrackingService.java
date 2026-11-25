package com.toeic.nhom11.service;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.*;

/** Lộ trình cá nhân và thống kê từ dữ liệu đã nộp; không tạo số liệu minh họa. */
@Service
public class StudyTrackingService {
    private final JdbcTemplate db;
    public StudyTrackingService(JdbcTemplate db) { this.db = db; }
    private static final String ACTIVITIES = """
        SELECT user_id, 'VOCAB' skill, correct_count correct, question_count total, submitted_at, NULL exam_score FROM vocabulary_quiz_attempts
        UNION ALL SELECT user_id, 'GRAMMAR', correct_count, total_questions, submitted_at, NULL FROM grammar_attempts
        UNION ALL SELECT a.user_id, s.skill, a.correct_count, a.total_questions, a.submitted_at, NULL FROM practice_attempts a JOIN practice_sets s ON s.id=a.practice_set_id WHERE a.submitted_at IS NOT NULL
        UNION ALL SELECT user_id, 'EXAM', NULL, NULL, submitted_at, total_scaled FROM exam_attempts WHERE status='SUBMITTED' AND submitted_at IS NOT NULL
        """;
    private static final String COUNTS = "COUNT(a.submitted_at) attempts, COUNT(DISTINCT a.user_id) active_students, COALESCE(SUM(a.correct),0) correct, COALESCE(SUM(a.total),0) total, ROUND(100.0*SUM(a.correct)/NULLIF(SUM(a.total),0),1) accuracy, ROUND(AVG(a.exam_score),1) exam_average";
    private static final String PLAN = """
        SELECT p.*, u.email, COALESCE(up.full_name,u.email) full_name,
        (SELECT COUNT(*) FROM study_plan_items i WHERE i.plan_id=p.id) item_count,
        (SELECT COUNT(*) FROM study_plan_items i WHERE i.plan_id=p.id AND i.is_completed=1) done_count
        FROM study_plans p JOIN users u ON u.id=p.user_id LEFT JOIN user_profiles up ON up.user_id=u.id
        """;
    private static final String ITEMS = """
        SELECT i.*, COALESCE(v.title,g.title,s.title,e.title) title, s.skill, s.part_no,
        CASE WHEN i.item_type='VOCAB_TOPIC' THEN v.is_published WHEN i.item_type='GRAMMAR_LESSON' THEN g.is_published WHEN i.item_type='PRACTICE_SET' THEN s.is_published ELSE e.is_published END published,
        CASE WHEN i.item_type='VOCAB_TOPIC' THEN CONCAT('/vocabulary/',v.id) WHEN i.item_type='GRAMMAR_LESSON' THEN CONCAT('/grammar/',g.id) WHEN s.skill='LISTENING' THEN CONCAT('/listening/practice/',s.id) WHEN s.skill='READING' THEN CONCAT('/reading/part',s.part_no) ELSE '/exams' END link
        FROM study_plan_items i LEFT JOIN vocabulary_topics v ON v.id=i.vocabulary_topic_id LEFT JOIN grammar_lessons g ON g.id=i.grammar_lesson_id LEFT JOIN practice_sets s ON s.id=i.practice_set_id LEFT JOIN exam_papers e ON e.id=i.exam_paper_id
        WHERE i.plan_id=? ORDER BY i.item_order,i.id
        """;
    public long studentId(String email) {
        return db.query("SELECT id FROM users WHERE email=? AND role='STUDENT' AND status='ACTIVE'", (rs,n)->rs.getLong(1), email).stream().findFirst().orElseThrow(()->new IllegalArgumentException("Không tìm thấy học viên đang hoạt động."));
    }
    public List<Map<String,Object>> students() { return db.queryForList("SELECT u.id,u.email,COALESCE(p.full_name,u.email) full_name FROM users u LEFT JOIN user_profiles p ON p.user_id=u.id WHERE u.role='STUDENT' AND u.status='ACTIVE' ORDER BY u.email"); }
    public List<Map<String,Object>> plans(Long userId) { return userId==null?db.queryForList(PLAN+" ORDER BY p.id DESC"):db.queryForList(PLAN+" WHERE p.user_id=? AND p.status<>'ARCHIVED' ORDER BY p.id DESC",userId); }
    public Map<String,Object> plan(long id) { return db.queryForList(PLAN+" WHERE p.id=?",id).stream().findFirst().orElseThrow(()->new IllegalArgumentException("Không tìm thấy lộ trình.")); }
    public List<Map<String,Object>> items(long id) { return db.queryForList(ITEMS,id); }
    public List<Map<String,Object>> catalog() { return db.queryForList("""
        SELECT 'VOCAB_TOPIC' type,id, title, 'Từ vựng' category FROM vocabulary_topics WHERE is_published=1
        UNION ALL SELECT 'GRAMMAR_LESSON',id,title,'Ngữ pháp' FROM grammar_lessons WHERE is_published=1
        UNION ALL SELECT 'PRACTICE_SET',id,title,CONCAT(skill,' Part ',part_no) FROM practice_sets WHERE is_published=1
        UNION ALL SELECT 'EXAM',id,title,'Thi thử' FROM exam_papers WHERE is_published=1 ORDER BY category,title
        """); }
    private void validate(String title,int score,LocalDate start,LocalDate end) {
        if(title==null||title.isBlank()||title.strip().length()>200||score<10||score>990||score%5!=0||start==null||end==null||end.isBefore(start)) throw new IllegalArgumentException("Kiểm tra tên, điểm mục tiêu (10–990, bội số 5) và thời gian.");
    }
    @Transactional public void create(long user,String title,int score,LocalDate start,LocalDate end) {
        validate(title,score,start,end);
        if(db.queryForObject("SELECT COUNT(*) FROM users WHERE id=? AND role='STUDENT' AND status='ACTIVE'",Integer.class,user)!=1) throw new IllegalArgumentException("Học viên không hợp lệ.");
        db.update("INSERT INTO study_plans(user_id,title,target_score,start_date,target_date,status) VALUES(?,?,?,?,?,'ACTIVE')",user,title.strip(),score,start,end);
    }
    @Transactional public void edit(long id,String title,int score,LocalDate start,LocalDate end,String status) {
        validate(title,score,start,end);
        if(!Set.of("ACTIVE","COMPLETED","ARCHIVED").contains(status)) throw new IllegalArgumentException("Trạng thái không hợp lệ.");
        if(db.update("UPDATE study_plans SET title=?,target_score=?,start_date=?,target_date=?,status=? WHERE id=?",title.strip(),score,start,end,status,id)==0) plan(id);
    }
    private void lockActive(long id) {
        if(db.queryForList("SELECT id FROM study_plans WHERE id=? AND status='ACTIVE' FOR UPDATE",id).isEmpty()) throw new IllegalArgumentException("Chỉ chỉnh nhiệm vụ của lộ trình đang hoạt động.");
    }
    @Transactional public void add(long plan,String choice,int order,LocalDate due) {
        lockActive(plan);
        if(choice==null||!choice.matches("(VOCAB_TOPIC|GRAMMAR_LESSON|PRACTICE_SET|EXAM):[1-9][0-9]{0,17}")||order<0||order>100000) throw new IllegalArgumentException("Nhiệm vụ hoặc thứ tự không hợp lệ.");
        String[] parts=choice.split(":"); long id=Long.parseLong(parts[1]);
        String[] fields=switch(parts[0]) {case "VOCAB_TOPIC" -> new String[]{"vocabulary_topics","vocabulary_topic_id"};case "GRAMMAR_LESSON" -> new String[]{"grammar_lessons","grammar_lesson_id"};case "PRACTICE_SET" -> new String[]{"practice_sets","practice_set_id"};default -> new String[]{"exam_papers","exam_paper_id"};};
        if(db.queryForObject("SELECT COUNT(*) FROM "+fields[0]+" WHERE id=? AND is_published=1",Integer.class,id)!=1) throw new IllegalArgumentException("Học liệu chưa công bố hoặc không tồn tại.");
        if(due!=null&&db.queryForObject("SELECT COUNT(*) FROM study_plans WHERE id=? AND ? BETWEEN start_date AND target_date",Integer.class,plan,due)!=1) throw new IllegalArgumentException("Hạn nhiệm vụ phải nằm trong thời gian lộ trình.");
        if(db.queryForObject("SELECT COUNT(*) FROM study_plan_items WHERE plan_id=? AND "+fields[1]+"=?",Integer.class,plan,id)>0) throw new IllegalArgumentException("Nhiệm vụ đã tồn tại.");
        db.update("INSERT INTO study_plan_items(plan_id,item_type,"+fields[1]+",item_order,due_date) VALUES(?,?,?,?,?)",plan,parts[0],id,order,due);
    }
    @Transactional public void remove(long plan,long item) { lockActive(plan); if(db.update("DELETE FROM study_plan_items WHERE id=? AND plan_id=? AND is_completed=0",item,plan)!=1) throw new IllegalArgumentException("Chỉ bỏ được nhiệm vụ chưa hoàn thành."); }
    @Transactional public void reorder(long plan,long item,int order) { lockActive(plan); if(order<0||order>100000) throw new IllegalArgumentException("Thứ tự không hợp lệ."); db.update("UPDATE study_plan_items SET item_order=? WHERE id=? AND plan_id=?",order,item,plan); }
    @Transactional public void mark(long user,long item,boolean done) {
        // Kiểm tra quyền sở hữu ở ngay câu SQL; không lấy userId từ trình duyệt.
        if(db.update("UPDATE study_plan_items i JOIN study_plans p ON p.id=i.plan_id SET i.completed_at=CASE WHEN ?=1 THEN COALESCE(i.completed_at,CURRENT_TIMESTAMP) ELSE NULL END,i.is_completed=? WHERE i.id=? AND p.user_id=? AND p.status='ACTIVE'",done,done,item,user)==0 && db.queryForObject("SELECT COUNT(*) FROM study_plan_items i JOIN study_plans p ON p.id=i.plan_id WHERE i.id=? AND p.user_id=? AND p.status='ACTIVE'",Integer.class,item,user)==0) throw new IllegalArgumentException("Không tìm thấy nhiệm vụ thuộc lộ trình đang hoạt động của bạn.");
    }
    private int period(int days) {return days==7||days==30?days:0;}
    private String activityFilter(int days) { return period(days)==0?"":" AND a.submitted_at >= ?"; }
    private Object[] params(Long user,int days) { List<Object> args=new ArrayList<>(); if(user!=null)args.add(user); if(period(days)>0)args.add(java.sql.Timestamp.valueOf(LocalDate.now().minusDays(days-1L).atStartOfDay())); return args.toArray(); }
    public Map<String,Object> totals(Long user,int days) { return db.queryForMap("SELECT "+COUNTS+" FROM ("+ACTIVITIES+") a JOIN users u ON u.id=a.user_id WHERE u.role='STUDENT'"+(user==null?"":" AND u.id=?")+activityFilter(days),params(user,days)); }
    public List<Map<String,Object>> skills(Long user,int days) { return db.queryForList("SELECT a.skill,"+COUNTS+" FROM ("+ACTIVITIES+") a JOIN users u ON u.id=a.user_id WHERE u.role='STUDENT'"+(user==null?"":" AND u.id=?")+activityFilter(days)+" GROUP BY a.skill ORDER BY a.skill",params(user,days)); }
    public List<Map<String,Object>> byStudent(int days,String query,int page) {
        List<Object> args=new ArrayList<>(); if(period(days)>0)args.add(java.sql.Timestamp.valueOf(LocalDate.now().minusDays(days-1L).atStartOfDay()));
        String q="%"+(query==null?"":query.strip())+"%"; args.add(q);args.add(q);args.add(Math.max(0,Math.min(page,100000))*25L);
        return db.queryForList("SELECT u.id,u.email,COALESCE(p.full_name,u.email) full_name,"+COUNTS+" FROM users u LEFT JOIN user_profiles p ON p.user_id=u.id LEFT JOIN ("+ACTIVITIES+") a ON a.user_id=u.id"+activityFilter(days)+" WHERE u.role='STUDENT' AND (u.email LIKE ? OR p.full_name LIKE ?) GROUP BY u.id,u.email,p.full_name ORDER BY attempts DESC,u.id LIMIT 25 OFFSET ?",args.toArray());
    }
    public long studentCount() {return db.queryForObject("SELECT COUNT(*) FROM users WHERE role='STUDENT'",Long.class);}
    public long mastered(long user) {return db.queryForObject("SELECT COUNT(*) FROM user_vocabulary_progress WHERE user_id=? AND learning_status='MASTERED'",Long.class,user);}
    public List<Map<String,Object>> daily(Long user) {return db.queryForList("SELECT DATE(a.submitted_at) day,COUNT(*) attempts FROM ("+ACTIVITIES+") a JOIN users u ON u.id=a.user_id WHERE u.role='STUDENT'"+(user==null?"":" AND u.id=?")+activityFilter(7)+" GROUP BY DATE(a.submitted_at) ORDER BY day",params(user,7));}
}
