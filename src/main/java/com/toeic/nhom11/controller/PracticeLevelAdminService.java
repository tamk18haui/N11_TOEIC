package com.toeic.nhom11.controller;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** Chỉ thay đổi phân loại của bộ luyện; không di chuyển câu hỏi hay tài nguyên. */
@Service
public class PracticeLevelAdminService {
    private final JdbcTemplate jdbc;
    private static final Pattern TOKEN = Pattern.compile("\\[(?:LISTENING_LEVEL|READING_PART[567]_LEVEL):[0-9]+\\]");
    public PracticeLevelAdminService(JdbcTemplate jdbc) { this.jdbc = jdbc; }
    static String token(String skill, int part, int level) {
        return skill.equals("LISTENING") ? "[LISTENING_LEVEL:"+level+"]" : "[READING_PART"+part+"_LEVEL:"+level+"]";
    }
    static int current(String skill, int part, Object instructions) {
        String s = Objects.toString(instructions, "");
        for(int n=1;n<=5;n++) if(skill.equals("READING") ? s.startsWith(token(skill,part,n)) : s.contains(token(skill,part,n))) return n;
        return 0;
    }
    @Transactional
    public int assign(String skill,long id,int requested,boolean random) {
        if(!Set.of("LISTENING","READING").contains(skill)) throw new IllegalArgumentException("Kỹ năng không hợp lệ.");
        // Lock the relevant skill's existing sets in ID order to serialize level assignments.
        var rows=jdbc.queryForList("SELECT id,part_no,instructions,is_published FROM practice_sets WHERE skill=? ORDER BY id FOR UPDATE",skill);
        var row=rows.stream().filter(r->((Number)r.get("id")).longValue()==id).findFirst().orElseThrow(()->new IllegalArgumentException("Không tìm thấy bộ luyện."));
        int part=((Number)row.get("part_no")).intValue();
        Object pub=row.get("is_published"); boolean published=Boolean.TRUE.equals(pub)||pub instanceof Number n && n.intValue()!=0;
        int old=current(skill,part,row.get("instructions"));
        List<Integer> allowed=new ArrayList<>(List.of(1,2,3,4,5));
        // Existing student Reading DAO selects one published set per Part/level.
        if(skill.equals("READING")) for(var r:rows) {
            Object p=r.get("is_published");
            if(((Number)r.get("id")).longValue()!=id && ((Number)r.get("part_no")).intValue()==part && (Boolean.TRUE.equals(p)||p instanceof Number n && n.intValue()!=0))
                allowed.remove(Integer.valueOf(current(skill,part,r.get("instructions"))));
        }
        int level=requested;
        if(random) {
            if(allowed.size()>1) allowed.remove(Integer.valueOf(old));
            if(allowed.isEmpty()) throw new IllegalArgumentException("Không còn cấp trống cho Part này; hãy ẩn một bộ Reading trước.");
            level=allowed.get(ThreadLocalRandom.current().nextInt(allowed.size()));
        }
        if(level<0 || level>5) throw new IllegalArgumentException("Cấp độ phải từ 1 đến 5 hoặc chưa phân loại.");
        if(level==0 && published) throw new IllegalArgumentException("Hãy ẩn bộ luyện trước khi bỏ cấp độ.");
        if(level>0 && published && !allowed.contains(level)) throw new IllegalArgumentException("Cấp này đã có bộ Reading công bố. Hãy chọn cấp khác hoặc ẩn bộ kia.");
        String clean=TOKEN.matcher(Objects.toString(row.get("instructions"),"")).replaceAll("").strip();
        String tagged=level==0?clean:token(skill,part,level)+(clean.isEmpty()?"":" "+clean);
        if(level==0) jdbc.update("UPDATE practice_sets SET instructions=? WHERE id=? AND skill=?",tagged,id,skill);
        else jdbc.update("UPDATE practice_sets SET instructions=?,difficulty=? WHERE id=? AND skill=?",tagged,level<=2?"EASY":level==3?"MEDIUM":"HARD",id,skill);
        return level;
    }
}
