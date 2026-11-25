package com.toeic.nhom11.exam.admin;

import java.sql.Statement;
import java.util.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Isolation;

/** Quản trị đề thi dùng ngân hàng câu hỏi hiện có; không sinh điểm TOEIC giả. */
@Service
public class ExamAdminService {
    private final JdbcTemplate db;
    @org.springframework.beans.factory.annotation.Value("${N11_LISTENING_UPLOAD_DIR:./listening-uploads}") private String localMediaDir="./listening-uploads";
    private static final int[] FULL = {0,6,25,39,30,30,16,54};
    private static final String PAPER = """
        SELECT e.*, (SELECT COUNT(*) FROM exam_paper_questions x WHERE x.exam_paper_id=e.id) question_count,
        (SELECT COUNT(*) FROM exam_attempts a WHERE a.exam_paper_id=e.id) attempt_count,
        (SELECT COUNT(*) FROM exam_score_scales t WHERE t.exam_paper_id=e.id) scale_count
        FROM exam_papers e
        """;
    private static final String QUESTIONS = """
        SELECT q.id,q.practice_set_id,q.passage_id,q.sort_order,q.question_text,q.explanation,s.part_no,s.title set_title,
               s.is_published, p.passage_text, p.practice_set_id passage_set_id,
               COALESCE(a.file_url,pa.file_url) audio_url, COALESCE(im.file_url,pi.file_url) image_url,
               (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id) option_count,
               (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id AND o.is_correct=1) correct_count,
               (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id AND o.option_label IN ('A','B','C')) abc_count,
               (SELECT COUNT(*) FROM practice_options o WHERE o.question_id=q.id AND o.option_label='D') d_count
        FROM practice_questions q JOIN practice_sets s ON s.id=q.practice_set_id
        LEFT JOIN practice_passages p ON p.id=q.passage_id
        LEFT JOIN media_assets a ON a.id=q.audio_media_id AND a.media_type='AUDIO'
        LEFT JOIN media_assets pa ON pa.id=p.audio_media_id AND pa.media_type='AUDIO'
        LEFT JOIN media_assets im ON im.id=q.image_media_id AND im.media_type='IMAGE'
        LEFT JOIN media_assets pi ON pi.id=p.image_media_id AND pi.media_type='IMAGE'
        """;
    public ExamAdminService(JdbcTemplate db){this.db=db;}
    private static long n(Object o){return ((Number)o).longValue();}
    private static boolean yes(Object o){return Boolean.TRUE.equals(o)||o instanceof Number x&&x.intValue()!=0;}
    private long count(String sql,Object... a){return Objects.requireNonNull(db.queryForObject(sql,Long.class,a));}
    private static void part(int p){if(p<1||p>7)throw new IllegalArgumentException("Part phải từ 1 đến 7.");}
    private static String text(String s,int max,boolean required){String t=Objects.toString(s,"").strip();if(t.length()>max||required&&t.isEmpty())throw new IllegalArgumentException("Nội dung không hợp lệ hoặc quá dài.");return t;}
    private static void metadata(String type,int duration){if(!Set.of("LR_FULL","LR_CUSTOM").contains(type)||duration<1||duration>180||type.equals("LR_FULL")&&duration!=120)throw new IllegalArgumentException("Full Test cần 120 phút; đề tùy chọn từ 1 đến 180 phút.");}
    public List<Map<String,Object>> papers(String q,String status){
        String sql=PAPER+" WHERE (e.title LIKE ? OR e.description LIKE ?)";
        String s="%"+text(q,220,false)+"%";
        if("published".equals(status))sql+=" AND e.is_published=1";
        else if("draft".equals(status))sql+=" AND e.is_published=0";
        return db.queryForList(sql+" ORDER BY e.id DESC",s,s);
    }
    public Map<String,Object> paper(long id){return db.queryForList(PAPER+" WHERE e.id=?",id).stream().findFirst().orElseThrow(()->new IllegalArgumentException("Không tìm thấy đề thi."));}
    private void lockPaper(long id){if(db.queryForList("SELECT id FROM exam_papers WHERE id=? FOR UPDATE",id).isEmpty())throw new IllegalArgumentException("Không tìm thấy đề thi.");}
    private Map<String,Object> editable(long id){lockPaper(id);var e=paper(id);if(yes(e.get("is_published"))||n(e.get("attempt_count"))>0)throw new IllegalArgumentException("Chỉ chỉnh đề nháp chưa có lượt thi. Hãy ẩn đề trước khi sửa.");return e;}
    private void lockBank(){db.queryForList("SELECT id FROM practice_sets ORDER BY id FOR UPDATE");}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public long create(String title,String description,String type,int duration,String email){
        metadata(type,duration);String t=text(title,220,true),d=text(description,5000,false);
        long admin=db.query("SELECT id FROM users WHERE email=? AND role='ADMIN' AND status='ACTIVE'",(rs,i)->rs.getLong(1),email).stream().findFirst().orElseThrow(()->new IllegalArgumentException("Tài khoản Admin không hợp lệ."));
        var key=new GeneratedKeyHolder();db.update(c->{var ps=c.prepareStatement("INSERT INTO exam_papers(title,description,exam_type,duration_minutes,is_published,created_by) VALUES(?,?,?,?,0,?)",Statement.RETURN_GENERATED_KEYS);ps.setString(1,t);ps.setString(2,d);ps.setString(3,type);ps.setInt(4,duration);ps.setLong(5,admin);return ps;},key);
        return Objects.requireNonNull(key.getKey()).longValue();
    }
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void edit(long id,String title,String description,String type,int duration){var e=editable(id);metadata(type,duration);if("LR_FULL".equals(type)){for(var row:distribution(id))if(n(row.get("count"))>n(row.get("target")))throw new IllegalArgumentException("Số câu của một Part vượt giới hạn Full Test. Hãy bỏ bớt trước khi đổi loại đề.");}db.update("UPDATE exam_papers SET title=?,description=?,exam_type=?,duration_minutes=? WHERE id=?",text(title,220,true),text(description,5000,false),type,duration,id);if(!type.equals(e.get("exam_type")))clearScales(id);}
    public List<Map<String,Object>> distribution(long id){
        var rows=db.queryForList("SELECT s.part_no,COUNT(*) n FROM exam_paper_questions x JOIN practice_questions q ON q.id=x.question_id JOIN practice_sets s ON s.id=q.practice_set_id WHERE x.exam_paper_id=? GROUP BY s.part_no",id);
        var result=new ArrayList<Map<String,Object>>();for(int p=1;p<=7;p++){int part=p;long c=rows.stream().filter(r->n(r.get("part_no"))==part).mapToLong(r->n(r.get("n"))).sum();result.add(Map.of("part",p,"count",c,"target",FULL[p]));}return result;
    }
    // Một nhóm = toàn bộ câu chung đoạn/audio. Không cắt đôi Part 3,4,6,7.
    record Group(long id,int part,List<Map<String,Object>> questions){
        int size(){return questions.size();}
        List<Long> ids(){return questions.stream().map(q->n(q.get("id"))).toList();}
    }
    static boolean media(Object value){String u=Objects.toString(value,"");return u.matches("(?i)https://[^\\s<>\"']+")||u.matches("/listening-media/[A-Za-z0-9_-]+\\.[A-Za-z0-9]{1,8}");}
    private boolean localAvailable(Object value){
        String u=Objects.toString(value,"");if(!u.startsWith("/listening-media/"))return true;
        String name=u.substring("/listening-media/".length());
        if(!name.matches("[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\\.(mp3|wav|ogg|png|jpg|jpeg|webp)"))return false;
        var f=java.nio.file.Path.of(localMediaDir).resolve(name);return java.nio.file.Files.isRegularFile(f)&&java.nio.file.Files.isReadable(f);
    }
    private boolean validQuestion(Map<String,Object> q,int p){
        if(!localAvailable(q.get("audio_url"))||!localAvailable(q.get("image_url")))return false;
        int expected=p==2?3:4;
        if(n(q.get("option_count"))!=expected||n(q.get("correct_count"))!=1||n(q.get("abc_count"))!=3||n(q.get("d_count"))!=(p==2?0:1))return false;
        if(q.get("passage_id")!=null&&(!Objects.equals(q.get("practice_set_id"),q.get("passage_set_id"))&& (q.get("passage_set_id")==null||n(q.get("practice_set_id"))!=n(q.get("passage_set_id")))))return false;
        if(p<=4&&!media(q.get("audio_url")))return false;
        if(p==1&&!media(q.get("image_url")))return false;
        return p<6||q.get("passage_text")!=null&&!q.get("passage_text").toString().isBlank()||media(q.get("image_url"));
    }
    private List<Group> groups(int p){return groups(p,null);}
    // N11 V36 exam-only source: chỉ đề sở hữu được dùng nguồn riêng, không đưa vào ngân hàng luyện tập.
    private List<Group> groups(int p,Long exam){part(p);String sql=QUESTIONS+" WHERE s.part_no=? AND (s.is_published=1";
        if(exam!=null)sql+=" OR (s.instructions LIKE '[N11_OFFLINE_EXAM_V35:%' AND EXISTS (SELECT 1 FROM exam_paper_questions own WHERE own.exam_paper_id=? AND own.question_id IN (SELECT src.id FROM practice_questions src WHERE src.practice_set_id=s.id)))";
        sql+=") ORDER BY s.id,q.sort_order,q.id";var rows=exam==null?db.queryForList(sql,p):db.queryForList(sql,p,exam);Map<String,List<Map<String,Object>>> grouped=new LinkedHashMap<>();for(var q:rows){String key=q.get("passage_id")==null?"q:"+q.get("id"):"p:"+q.get("passage_id");grouped.computeIfAbsent(key,k->new ArrayList<>()).add(q);}
        var result=new ArrayList<Group>();for(var qs:grouped.values()){int size=qs.size();boolean ok=switch(p){case 3,4 -> size==3&&qs.getFirst().get("passage_id")!=null;case 6 -> size==4&&qs.getFirst().get("passage_id")!=null;case 7 -> size>=2&&size<=5&&qs.getFirst().get("passage_id")!=null;default -> size==1;};if(ok&&qs.stream().allMatch(q->validQuestion(q,p)))result.add(new Group(n(qs.getFirst().get("id")),p,qs));}return result;
    }
    private List<Long> selected(long id){return db.query("SELECT question_id FROM exam_paper_questions WHERE exam_paper_id=? ORDER BY question_order",(rs,i)->rs.getLong(1),id);}
    private static boolean overlaps(Group g,Set<Long> ids){return g.ids().stream().anyMatch(ids::contains);}
    private static String shortText(Object value){String t=Objects.toString(value,"").replaceAll("\\s+"," ");return t.length()>135?t.substring(0,135)+"…":t;}
    public List<Map<String,Object>> candidates(long id,int p,String search,int page){var used=new HashSet<>(selected(id));String q=text(search,220,false).toLowerCase(Locale.ROOT);return groups(p).stream().filter(g->!overlaps(g,used)).filter(g->q.isEmpty()||g.questions.stream().anyMatch(x->(Objects.toString(x.get("question_text"),"")+" "+x.get("set_title")+" "+x.get("id")).toLowerCase(Locale.ROOT).contains(q))).skip(Math.max(0,Math.min(page,10000))*40L).limit(41).map(g->Map.<String,Object>of("id",g.id,"size",g.size(),"title",Objects.toString(g.questions.getFirst().get("set_title"),""),"sample",shortText(g.questions.getFirst().get("question_text")))).toList();}
    public List<Map<String,Object>> selectedGroups(long id){var rows=db.queryForList("""
        SELECT x.question_id id,x.question_order,q.passage_id,q.question_text,s.part_no,s.title set_title
        FROM exam_paper_questions x JOIN practice_questions q ON q.id=x.question_id JOIN practice_sets s ON s.id=q.practice_set_id
        WHERE x.exam_paper_id=? ORDER BY x.question_order
        """,id);var groups=new LinkedHashMap<String,List<Map<String,Object>>>();for(var r:rows){String key=r.get("passage_id")==null?"q:"+r.get("id"):"p:"+r.get("passage_id");groups.computeIfAbsent(key,k->new ArrayList<>()).add(r);}return groups.values().stream().map(g->Map.<String,Object>of("id",n(g.getFirst().get("id")),"part",n(g.getFirst().get("part_no")),"size",g.size(),"start",n(g.getFirst().get("question_order")),"end",n(g.getLast().get("question_order")),"title",Objects.toString(g.getFirst().get("set_title"),""),"sample",shortText(g.getFirst().get("question_text")))).toList();}
    // DP tìm đúng số câu mà không cắt nhóm; xáo trộn trước để chọn ngẫu nhiên.
    static List<Group> exact(List<Group> input,int target,Random random){if(target<1||target>200)throw new IllegalArgumentException("Số câu phải từ 1 đến 200.");var pool=new ArrayList<>(input);Collections.shuffle(pool,random);int[] prev=new int[target+1],which=new int[target+1];Arrays.fill(prev,-1);prev[0]=0;for(int i=0;i<pool.size();i++){int size=pool.get(i).size();for(int k=target;k>=size;k--)if(prev[k]<0&&prev[k-size]>=0){prev[k]=k-size;which[k]=i;}}if(prev[target]<0)throw new IllegalArgumentException("Ngân hàng không đủ nhóm câu hợp lệ để chọn đúng "+target+" câu.");var chosen=new ArrayList<Group>();for(int k=target;k>0;k=prev[k])chosen.add(pool.get(which[k]));return chosen;}
    private void clearScales(long id){db.update("DELETE FROM exam_score_scales WHERE exam_paper_id=?",id);}
    private void replace(long id,List<Long> ids){
        // Chỉ đề nháp không có lượt thi; thứ tự chuẩn theo Part, giữ nhóm liền nhau.
        if(ids.size()>200||new HashSet<>(ids).size()!=ids.size())throw new IllegalArgumentException("Đề tối đa 200 câu, không trùng câu hỏi.");
        var parts=new HashMap<Long,Integer>();for(var r:db.queryForList("SELECT q.id,s.part_no FROM practice_questions q JOIN practice_sets s ON s.id=q.practice_set_id"))parts.put(n(r.get("id")),(int)n(r.get("part_no")));
        if(ids.stream().anyMatch(x->!parts.containsKey(x)))throw new IllegalArgumentException("Câu hỏi không tồn tại.");
        ids.sort(Comparator.comparingInt(parts::get));db.update("DELETE FROM exam_paper_questions WHERE exam_paper_id=?",id);for(int i=0;i<ids.size();i++)db.update("INSERT INTO exam_paper_questions(exam_paper_id,question_id,question_order) VALUES(?,?,?)",id,ids.get(i),i+1);clearScales(id);
    }
    private void append(long id,Map<String,Object> e,int p,List<Long> old,List<Group> chosen){var next=new ArrayList<>(old);for(var g:chosen)next.addAll(g.ids());if("LR_FULL".equals(e.get("exam_type"))){long existing=distribution(id).get(p-1).get("count") instanceof Number x?x.longValue():0;if(existing+chosen.stream().mapToInt(Group::size).sum()>FULL[p])throw new IllegalArgumentException("Part "+p+" vượt số câu chuẩn Full Test ("+FULL[p]+").");}replace(id,next);}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void add(long id,int p,List<Long> groupIds){part(p);var e=editable(id);lockBank();var old=selected(id);var used=new HashSet<>(old);if(groupIds==null||groupIds.isEmpty()||groupIds.size()>200||new HashSet<>(groupIds).size()!=groupIds.size())throw new IllegalArgumentException("Hãy chọn nhóm câu hợp lệ.");var available=new HashMap<Long,Group>();for(var g:groups(p))if(!overlaps(g,used))available.put(g.id,g);var chosen=new ArrayList<Group>();for(long key:groupIds){var g=available.get(key);if(g==null)throw new IllegalArgumentException("Nhóm câu không còn khả dụng hoặc đã có trong đề.");chosen.add(g);}append(id,e,p,old,chosen);}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void random(long id,int p,int amount){part(p);var e=editable(id);lockBank();var old=selected(id);var used=new HashSet<>(old);if(amount>200-old.size())throw new IllegalArgumentException("Đề tối đa 200 câu.");append(id,e,p,old,exact(groups(p).stream().filter(g->!overlaps(g,used)).toList(),amount,new Random()));}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void remove(long id,long question){editable(id);lockBank();var old=selected(id);if(!old.contains(question))throw new IllegalArgumentException("Câu không thuộc đề này.");var row=db.queryForMap("SELECT passage_id FROM practice_questions WHERE id=?",question);if(row.get("passage_id")==null)old=new ArrayList<>(old.stream().filter(x->x!=question).toList());else{var group=new HashSet<>(db.query("SELECT id FROM practice_questions WHERE passage_id=?",(rs,i)->rs.getLong(1),row.get("passage_id")));old=new ArrayList<>(old.stream().filter(x->!group.contains(x)).toList());}replace(id,old);}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void generateFull(long id){var e=editable(id);if(!"LR_FULL".equals(e.get("exam_type")))throw new IllegalArgumentException("Chỉ dùng cho Full Test.");lockBank();var next=new ArrayList<Long>();for(int p=1;p<=7;p++){try{for(var g:exact(groups(p),FULL[p],new Random()))next.addAll(g.ids());}catch(IllegalArgumentException ex){throw new IllegalArgumentException("Part "+p+": "+ex.getMessage());}}replace(id,next);}
    private void validatePublish(long id,Map<String,Object> e){
        if(count("SELECT COUNT(*) FROM exam_paper_questions x JOIN practice_questions q ON q.id=x.question_id JOIN practice_sets s ON s.id=q.practice_set_id WHERE x.exam_paper_id=? AND INSTR(COALESCE(s.instructions,''),'[N11_OFFLINE_REVIEW_REQUIRED]')>0",id)>0)throw new IllegalArgumentException("Nguồn offline còn cảnh báo media/nhóm; cần thay nhóm lỗi trước khi công bố.");
        var ids=selected(id);if(ids.isEmpty()||ids.size()>200)throw new IllegalArgumentException("Đề cần từ 1 đến 200 câu.");var chosen=new HashSet<>(ids);var valid=new HashSet<Long>();for(int p=1;p<=7;p++){for(var g:groups(p,id))if(chosen.containsAll(g.ids()))valid.addAll(g.ids());}if(!valid.equals(chosen))throw new IllegalArgumentException("Có câu thiếu đáp án, media, đoạn văn, nhóm chưa đủ hoặc bộ nguồn chưa công bố.");if("LR_FULL".equals(e.get("exam_type"))){for(var d:distribution(id))if(n(d.get("count"))!=n(d.get("target")))throw new IllegalArgumentException("Full Test chưa đủ số câu chuẩn ở Part "+d.get("part")+".");if(n(e.get("duration_minutes"))!=120)throw new IllegalArgumentException("Full Test cần 120 phút.");}}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void publish(long id,boolean published){lockPaper(id);var e=paper(id);if(published){lockBank();validatePublish(id,e);new ExamPracticeSync(db).sync(id);}db.update("UPDATE exam_papers SET is_published=? WHERE id=?",published,id);}
    // N11 V43: backfill published offline exams, without touching publication status.
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public int syncPublishedPractice(long id){lockPaper(id);var e=paper(id);if(!yes(e.get("is_published")))throw new IllegalArgumentException("Đề chưa công bố.");lockBank();validatePublish(id,e);return new ExamPracticeSync(db).sync(id);}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void delete(long id){editable(id);lockBank();if(count("SELECT COUNT(*) FROM study_plan_items WHERE exam_paper_id=?",id)>0)throw new IllegalArgumentException("Đề đã được giao trong lộ trình; không thể xóa.");clearScales(id);db.update("DELETE FROM exam_paper_questions WHERE exam_paper_id=?",id);db.update("DELETE FROM exam_papers WHERE id=?",id);}
    public List<Map<String,Object>> preview(long id){paper(id);var rows=db.queryForList(QUESTIONS+" JOIN exam_paper_questions x ON x.question_id=q.id WHERE x.exam_paper_id=? ORDER BY x.question_order",id);int order=0;for(var q:rows){q.put("number",++order);q.put("audio_url",media(q.get("audio_url"))?q.get("audio_url"):null);q.put("image_url",media(q.get("image_url"))?q.get("image_url"):null);q.put("options",db.queryForList("SELECT option_label,option_text,is_correct FROM practice_options WHERE question_id=? ORDER BY option_label",q.get("id")));}return rows;}
    public String scaleText(long id,String skill){return String.join("\n",db.query("SELECT raw_correct,scaled_score FROM exam_score_scales WHERE exam_paper_id=? AND skill=? ORDER BY raw_correct",(rs,i)->rs.getInt(1)+"="+rs.getInt(2),id,skill));}
    static Map<Integer,Integer> parseScale(String raw){var out=new TreeMap<Integer,Integer>();if(raw==null||raw.isBlank())return out;if(raw.length()>3000)throw new IllegalArgumentException("Bảng điểm quá dài.");for(String line:raw.strip().split("\\R")){if(line.isBlank())continue;if(!line.strip().matches("[0-9]{1,3}\\s*=\\s*[0-9]{1,3}"))throw new IllegalArgumentException("Bảng điểm: mỗi dòng dạng số câu đúng=điểm.");var s=line.split("=");int k=Integer.parseInt(s[0].strip()),v=Integer.parseInt(s[1].strip());if(k>100||v<5||v>495||v%5!=0||out.putIfAbsent(k,v)!=null)throw new IllegalArgumentException("Bảng điểm không hợp lệ hoặc trùng số câu đúng.");}if(out.size()!=101||out.firstKey()!=0||out.lastKey()!=100)throw new IllegalArgumentException("Cần đủ 101 dòng, từ 0 đến 100 câu đúng.");int last=0;for(int v:out.values()){if(v<last)throw new IllegalArgumentException("Điểm quy đổi phải không giảm.");last=v;}return out;}
    @Transactional(isolation=Isolation.READ_COMMITTED)
    public void scales(long id,String listening,String reading){var e=editable(id);lockBank();if(!"LR_FULL".equals(e.get("exam_type")))throw new IllegalArgumentException("Bảng quy đổi này dành cho Full Test.");var l=parseScale(listening);var r=parseScale(reading);if(l.isEmpty()!=r.isEmpty())throw new IllegalArgumentException("Nhập cả hai bảng hoặc để trống cả hai để xóa.");if(!l.isEmpty())validatePublish(id,e);clearScales(id);for(var s:Map.of("LISTENING",l,"READING",r).entrySet())for(var row:s.getValue().entrySet())db.update("INSERT INTO exam_score_scales(exam_paper_id,skill,raw_correct,scaled_score) VALUES(?,?,?,?)",id,s.getKey(),row.getKey(),row.getValue());}
}
