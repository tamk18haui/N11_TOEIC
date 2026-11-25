package com.toeic.nhom11.controller;

import java.sql.Statement;
import java.util.*;
import java.util.function.LongSupplier;
import java.util.regex.Pattern;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** Chuyển câu/nhóm sang bộ nháp cùng Part; giữ nguyên ID, đáp án và media. */
@Service
public class QuestionLevelRouter {
    private final JdbcTemplate jdbc;
    private static final Pattern TOKEN=Pattern.compile("\\[(?:LISTENING_LEVEL|READING_PART[567]_LEVEL):[0-9]+\\]");
    public QuestionLevelRouter(JdbcTemplate jdbc) {this.jdbc=jdbc;}
    private static long num(Object x){return ((Number)x).longValue();}
    private static boolean yes(Object x){return Boolean.TRUE.equals(x)||x instanceof Number n && n.intValue()!=0;}
    private long count(String sql,Object... args){return Objects.requireNonNull(jdbc.queryForObject(sql,Long.class,args));}
    private static String difficulty(int level){return level<=0||level==3?"MEDIUM":level<=2?"EASY":"HARD";}
    private boolean editable(Map<String,Object> s){return !yes(s.get("is_published"))&&count("SELECT COUNT(*) FROM practice_attempts WHERE practice_set_id=?",s.get("id"))==0;}
    @Transactional
    public long save(String skill,long sourceId,int level,LongSupplier saveQuestion){
        if(!Set.of("READING","LISTENING").contains(skill)||level< -1||level>5) throw new IllegalArgumentException("Cấp độ không hợp lệ.");
        // Khóa các bộ theo cùng thứ tự với thao tác phân cấp V21.
        var rows=jdbc.queryForList("SELECT id,part_no,instructions,is_published,created_by FROM practice_sets WHERE skill=? ORDER BY id FOR UPDATE",skill);
        var source=rows.stream().filter(s->num(s.get("id"))==sourceId).findFirst().orElseThrow(()->new IllegalArgumentException("Không tìm thấy bộ luyện."));
        if(!editable(source)) throw new IllegalArgumentException("Chỉ chỉnh sửa bộ nháp chưa có lượt làm.");
        int part=(int)num(source.get("part_no"));
        int old=PracticeLevelAdminService.current(skill,part,source.get("instructions"));
        // Nghiệp vụ lưu và kiểm tra đáp án hiện có chạy trong cùng transaction.
        long qid=saveQuestion.getAsLong();
        if(level==-1||level==old)return sourceId;
        var q=jdbc.queryForMap("SELECT id,passage_id FROM practice_questions WHERE id=? AND practice_set_id=?",qid,sourceId);
        Object passage=q.get("passage_id");
        long groupSize=passage==null?1:count("SELECT COUNT(*) FROM practice_questions WHERE practice_set_id=? AND passage_id=?",sourceId,passage);
        long total=count("SELECT COUNT(*) FROM practice_questions WHERE practice_set_id=?",sourceId);
        long passages=count("SELECT COUNT(*) FROM practice_passages WHERE practice_set_id=?",sourceId);
        String token=level==0?"":PracticeLevelAdminService.token(skill,part,level);
        // Nếu đây là toàn bộ học liệu của bộ, chỉ đổi cấp bộ hiện tại.
        if(total==groupSize && passages==(passage==null?0:1)){
            String clean=TOKEN.matcher(Objects.toString(source.get("instructions"),"")).replaceAll("").strip();
            String instructions=(token+" "+clean).strip();
            jdbc.update("UPDATE practice_sets SET instructions=?,difficulty=? WHERE id=? AND skill=?",instructions,difficulty(level),sourceId,skill);
            return sourceId;
        }
        // Nếu không, dùng bộ nháp cùng Part/cấp, hoặc tạo bộ nháp mới.
        long dest=0;
        for(var s:rows){
            if(num(s.get("id"))!=sourceId&&num(s.get("part_no"))==part&&PracticeLevelAdminService.current(skill,part,s.get("instructions"))==level&&editable(s)) {dest=num(s.get("id"));break;}
        }
        if(dest==0){
            var key=new GeneratedKeyHolder();
            String title=(skill.equals("READING")?"Reading":"Listening")+" Part "+part+" · "+(level==0?"Chưa phân loại":"Cấp "+level);
            jdbc.update(conn->{var st=conn.prepareStatement("INSERT INTO practice_sets(skill,part_no,title,instructions,difficulty,is_published,created_by) VALUES(?,?,?,?,?,0,?)",Statement.RETURN_GENERATED_KEYS);st.setString(1,skill);st.setInt(2,part);st.setString(3,title);st.setString(4,token);st.setString(5,difficulty(level));st.setObject(6,source.get("created_by"));return st;},key);
            dest=Objects.requireNonNull(key.getKey()).longValue();
        }
        if(passage!=null){
            // Một đoạn luôn ở cùng bộ với toàn bộ câu hỏi tham chiếu nó.
            if(count("SELECT COUNT(*) FROM practice_questions WHERE passage_id=? AND practice_set_id<>?",passage,sourceId)>0)throw new IllegalArgumentException("Đoạn có liên kết ngoài bộ luyện.");
            if(jdbc.update("UPDATE practice_passages SET practice_set_id=? WHERE id=? AND practice_set_id=?",dest,passage,sourceId)!=1)throw new IllegalArgumentException("Đoạn không thuộc bộ luyện.");
            jdbc.update("UPDATE practice_questions SET practice_set_id=? WHERE passage_id=? AND practice_set_id=?",dest,passage,sourceId);
        }else{
            if(jdbc.update("UPDATE practice_questions SET practice_set_id=? WHERE id=? AND practice_set_id=?",dest,qid,sourceId)!=1)throw new IllegalArgumentException("Không tìm thấy câu hỏi.");
        }
        return dest;
    }
}
