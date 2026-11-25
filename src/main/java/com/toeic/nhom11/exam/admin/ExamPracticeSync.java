package com.toeic.nhom11.exam.admin;

import java.util.*;
import java.text.Normalizer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import tools.jackson.databind.json.JsonMapper;

/** V43: called INSIDE ExamAdminService transaction after the exam and bank are locked.
 * Only copy private offline sources; never edit an exam question or an existing answer.
 * Reading attempts snapshot membership. Listening attempts do not, so create separate sets.
 */
final class ExamPracticeSync {
    private final JdbcTemplate db;
    private static final JsonMapper JSON=JsonMapper.builder().build();
    ExamPracticeSync(JdbcTemplate db){this.db=db;}
    static String str(Object x){return Objects.toString(x,"");}
    static long n(Object x){return ((Number)x).longValue();}
    static boolean yes(Object x){return Boolean.TRUE.equals(x)||x instanceof Number v&&v.intValue()!=0;}
    static String norm(Object x){return Normalizer.normalize(str(x),Normalizer.Form.NFC).replaceAll("\\s+"," ").strip();}
    static Object first(Object a,Object b){return a==null?b:a;}
    static String token(int p,int l){return p<=4?"[LISTENING_LEVEL:"+l+"]":"[READING_PART"+p+"_LEVEL:"+l+"]";}
    static int level(int p,Object instructions){String t=str(instructions);for(int l=1;l<=5;l++)if(p<=4?t.contains(token(p,l)):t.startsWith(token(p,l)))return l;return 0;}
    static int choose(int[] totals){int l=1;for(int i=2;i<=5;i++)if(totals[i]<totals[l])l=i;return l;}
    private long insert(String sql,Object... args){var key=new GeneratedKeyHolder();db.update(c->{var ps=c.prepareStatement(sql,java.sql.Statement.RETURN_GENERATED_KEYS);for(int i=0;i<args.length;i++)ps.setObject(i+1,args[i]);return ps;},key);return Objects.requireNonNull(key.getKey()).longValue();}
    private static final String SELECT="""
       SELECT s.id sid,s.part_no part,s.instructions,s.created_by,q.id qid,q.passage_id pid,
              q.question_text,q.explanation,q.audio_media_id qa,q.image_media_id qi,
              p.passage_text,p.audio_media_id pa,p.image_media_id pi,
              o.option_label,o.option_text,o.is_correct
       FROM practice_questions q JOIN practice_sets s ON s.id=q.practice_set_id
       LEFT JOIN practice_passages p ON p.id=q.passage_id AND p.practice_set_id=s.id
       LEFT JOIN practice_options o ON o.question_id=q.id
       """;
    static final class Question {final Map<String,Object> row;final List<Map<String,Object>> options=new ArrayList<>();Question(Map<String,Object> row){this.row=row;}}
    static final class Group {final int part;final long set;final Map<Long,Question> qs=new LinkedHashMap<>();Group(Map<String,Object> r){part=(int)n(r.get("part"));set=n(r.get("sid"));}Map<String,Object> head(){return qs.values().iterator().next().row;}}
    static List<Group> groups(List<Map<String,Object>> rows){var groups=new LinkedHashMap<String,Group>();for(var r:rows){int p=(int)n(r.get("part"));Object pid=r.get("pid");boolean grouped=p==3||p==4||p>=6;String key=r.get("sid")+":"+(grouped&&pid!=null?"p"+pid:"q"+r.get("qid"));var g=groups.computeIfAbsent(key,k->new Group(r));var q=g.qs.computeIfAbsent(n(r.get("qid")),k->new Question(r));if(r.get("option_label")!=null)q.options.add(r);}return new ArrayList<>(groups.values());}
    static List<?> lines(String raw){return Arrays.stream(raw.split("\\R",-1)).filter(s->!s.isBlank()).map(s->Map.of("en",s,"vi", "")).toList();}
    /** Keep existing structured text. Plain imported passage becomes the native Reading shape.
     * No OCR or made-up translation. Image-only passage is permitted only with a real media FK. */
    static String readingPassage(int part,Object raw,Object image){String text=str(raw).strip();if(text.startsWith("{")){
        try{Map<?,?> m=JSON.readValue(text,Map.class);if(part==6&&m.get("lines") instanceof List<?> l&&!l.isEmpty()||part==7&&m.get("documents") instanceof List<?> d&&!d.isEmpty())return text;}catch(RuntimeException ignored){}
        if(image==null)throw new IllegalArgumentException("Đoạn Reading JSON chưa hỗ trợ; cần kiểm tra nguồn.");text="";
    }if(text.isBlank()&&image==null)throw new IllegalArgumentException("Thiếu nội dung đoạn Reading.");var data=new LinkedHashMap<String,Object>();data.put("title","Bài đọc");if(part==6)data.put("lines",lines(text));else data.put("documents",List.of(Map.of("title","","title_vi","","lines",lines(text))));data.put("glossary",Map.of());return JSON.writeValueAsString(data);}
    static List<String> englishLines(Object value){if(!(value instanceof List<?> items))return List.of();var out=new ArrayList<String>();for(Object item:items)if(item instanceof Map<?,?> m&&!norm(m.get("en")).isBlank())out.add(norm(m.get("en")));return out;}
    static Object passageKey(Group g){var h=g.head();String raw=str(h.get("passage_text"));if(g.part<6)return norm(raw);try{String text=readingPassage(g.part,raw,h.get("pi"));Map<?,?> m=JSON.readValue(text,Map.class);if(g.part==6)return englishLines(m.get("lines"));if(m.get("documents") instanceof List<?> docs){var key=new ArrayList<List<String>>();for(Object item:docs)if(item instanceof Map<?,?> doc)key.add(englishLines(doc.get("lines")));return key;}}catch(RuntimeException ignored){}return norm(raw); }
    static List<Object> signature(Group g){var h=g.head();var key=new ArrayList<Object>();key.add(g.part);if(g.part>=3&&g.part!=5)key.add(passageKey(g));var qs=new ArrayList<List<Object>>();for(var q:g.qs.values()){var r=q.row;var v=new ArrayList<Object>();v.add(norm(r.get("question_text")));v.add(str(first(r.get("qa"),r.get("pa"))));v.add(str(first(r.get("qi"),r.get("pi"))));if(g.part>=6)v.add(str(r.get("pi")));v.add(q.options.stream().sorted(Comparator.comparing(o->str(o.get("option_label")))).map(o->List.of(str(o.get("option_label")),norm(o.get("option_text")),yes(o.get("is_correct")))).toList());qs.add(v);}key.add(qs);return key;}
    static void validate(Group g){int p=g.part,k=g.qs.size();boolean grouped=p==3||p==4||p>=6;if((grouped&&g.head().get("pid")==null)||(p==3||p==4?k!=3:p==6?k!=4:p==7?k<2||k>5:k!=1))throw new IllegalArgumentException("Nhóm Part "+p+" không hợp lệ.");for(var q:g.qs.values()){var r=q.row;Set<String> labels=new HashSet<>();for(var o:q.options)labels.add(str(o.get("option_label")));if(q.options.size()!=(p==2?3:4)||!labels.equals(p==2?Set.of("A","B","C"):Set.of("A","B","C","D"))||q.options.stream().filter(o->yes(o.get("is_correct"))).count()!=1)throw new IllegalArgumentException("Câu "+r.get("qid")+" thiếu đáp án hợp lệ.");if(p<=4&&first(r.get("qa"),r.get("pa"))==null||p==1&&first(r.get("qi"),r.get("pi"))==null)throw new IllegalArgumentException("Câu "+r.get("qid")+" thiếu media.");}}
    static String difficulty(int l){return l<=2?"EASY":l>=4?"HARD":"MEDIUM";}
    private long newSet(int p,int l,Object creator){return insert("INSERT INTO practice_sets(skill,part_no,title,instructions,difficulty,is_published,created_by) VALUES(?,?,?,?,?,1,?)",p<=4?"LISTENING":"READING",p,(p<=4?"Listening":"Reading")+" TOEIC · Part "+p+" · Cấp độ "+l,token(p,l)+"\n[N11_PRACTICE_SYNC_V43] Phân bổ theo số lượng; chưa hiệu chuẩn độ khó.",difficulty(l),creator);}
    static String practiceExplanation(int part,Object value){String raw=str(value).strip();if(raw.isEmpty())return raw;
        // V42-style mixed prose + JSON. Only parse an actual object; never guess an answer.
        int start=raw.indexOf('{');if(start<0)return raw;int depth=0,end=-1;boolean quoted=false,escaped=false;
        for(int i=start;i<raw.length();i++){char c=raw.charAt(i);if(quoted){if(escaped)escaped=false;else if(c=='\\')escaped=true;else if(c=='"')quoted=false;}else if(c=='"')quoted=true;else if(c=='{')depth++;else if(c=='}'&&--depth==0){end=i+1;break;}}
        if(end<0)return raw;
        try{Map<?,?> source=JSON.readValue(raw.substring(start,end),Map.class);var meta=new LinkedHashMap<String,Object>();for(var e:source.entrySet())if(e.getKey() instanceof String k)meta.put(k,e.getValue());var analysis=new LinkedHashMap<String,Object>();if(source.get("analysis") instanceof Map<?,?> a)for(var e:a.entrySet())if(e.getKey() instanceof String k)analysis.put(k,e.getValue());
            if(source.get("correct") instanceof Map<?,?> c&&c.get("letter") instanceof String label&&c.get("why") instanceof String why)analysis.put(label,why);
            if(source.get("wrong") instanceof List<?> w)for(Object item:w)if(item instanceof Map<?,?> c&&c.get("letter") instanceof String label&&c.get("why") instanceof String why)analysis.put(label,why);
            var explanation=new ArrayList<String>();if(start>0&&!raw.substring(0,start).isBlank())explanation.add(raw.substring(0,start).strip());if(source.get("explanation") instanceof String e&&!e.isBlank())explanation.add(e);if(source.get("summary") instanceof String e&&!e.isBlank())explanation.add("Ghi nhớ: "+e);
            if(explanation.isEmpty())return raw;
            String tail=raw.substring(end).strip();if(part>=3&&!tail.isBlank())explanation.add(tail);
            if(part>=5){meta.put("explanation",String.join("\n",explanation));meta.put("analysis",analysis);return JSON.writeValueAsString(meta);}
            for(var e:analysis.entrySet())explanation.add(e.getKey()+". "+e.getValue());return String.join("\n",explanation);
        }catch(RuntimeException ignored){return raw;}
    }
    static String optionTranscript(Group g){var q=g.qs.values().iterator().next();var r=q.row;String passage=str(r.get("passage_text")).strip();if(!passage.isEmpty())return passage;
        // A/B/C/D statements are original source choices, not generated translations.
        var options=q.options.stream().sorted(Comparator.comparing(o->str(o.get("option_label")))).map(o->str(o.get("option_text")).strip()).toList();
        if(options.size()==(g.part==2?3:4)&&options.stream().allMatch(x->!x.isBlank()&&!x.matches("(?i)^[A-D][.)]?$")))return String.join(" | ",options);
        return "";
    }
    private int append(Group g,long sid,int order){var h=g.head();Long pid=null;int p=g.part;Object passage=h.get("passage_text");if(p>=6)passage=readingPassage(p,passage,h.get("pi"));if(p<=2)passage=optionTranscript(g);if(p!=5&&(h.get("pid")!=null||p<=2&&!str(passage).isBlank()))pid=insert("INSERT INTO practice_passages(practice_set_id,passage_text,audio_media_id,image_media_id,sort_order) VALUES(?,?,?,?,?)",sid,passage,h.get("pa"),h.get("pi"),order);for(var q:g.qs.values()){var r=q.row;long id=insert("INSERT INTO practice_questions(practice_set_id,passage_id,question_text,explanation,audio_media_id,image_media_id,sort_order) VALUES(?,?,?,?,?,?,?)",sid,pid,r.get("question_text"),practiceExplanation(p,r.get("explanation")),p==5?first(r.get("qa"),r.get("pa")):r.get("qa"),p==5?first(r.get("qi"),r.get("pi")):r.get("qi"),order++);for(var o:q.options)db.update("INSERT INTO practice_options(question_id,option_label,option_text,is_correct) VALUES(?,?,?,?)",id,o.get("option_label"),o.get("option_text"),yes(o.get("is_correct")));}return order;}
    int sync(long paper){
        var source=groups(db.queryForList(SELECT+" JOIN exam_paper_questions e ON e.question_id=q.id WHERE e.exam_paper_id=? AND s.is_published=0 AND s.instructions LIKE '[N11_OFFLINE_EXAM_V35:%' ORDER BY e.question_order,o.option_label",paper));
        if(source.isEmpty())return 0;
        // Validate the whole source before writing. A failure rolls back publication, not a partial bank.
        for(var g:source){validate(g);if(g.part>=6)readingPassage(g.part,g.head().get("passage_text"),g.head().get("pi"));}
        var active=db.queryForList("SELECT id,part_no,instructions FROM practice_sets WHERE is_published=1 ORDER BY id");
        long[][] reading=new long[8][6];int[][] totals=new int[8][6];Set<Long> eligible=new HashSet<>();
        for(var s:active){int p=(int)n(s.get("part_no"));if(p<1||p>7)continue;int l=level(p,s.get("instructions"));if(l==0)continue;long id=n(s.get("id"));if(p<=4)eligible.add(id);else if(reading[p][l]==0){reading[p][l]=id;eligible.add(id);}}
        var known=new HashSet<List<Object>>();var bank=groups(db.queryForList(SELECT+" WHERE s.is_published=1 ORDER BY s.id,q.sort_order,q.id,o.option_label"));
        for(var g:bank){if(!eligible.contains(g.set))continue;int l=level(g.part,g.head().get("instructions"));if(l==0)continue;totals[g.part][l]+=g.qs.size();try{validate(g);known.add(signature(g));}catch(IllegalArgumentException ignored){/* do not treat an invalid old group as equivalent */}}
        long[][] listening=new long[8][6];var next=new HashMap<Long,Integer>();int copied=0;
        for(var g:source){if(!known.add(signature(g)))continue;int p=g.part,l=choose(totals[p]);long sid=p<=4?listening[p][l]:reading[p][l];if(sid==0){sid=newSet(p,l,g.head().get("created_by"));if(p<=4)listening[p][l]=sid;else reading[p][l]=sid;}
            final long setId=sid;int order=next.computeIfAbsent(sid,k->db.queryForObject("SELECT COALESCE(MAX(sort_order),0)+1 FROM practice_questions WHERE practice_set_id=?",Integer.class,setId));next.put(sid,append(g,sid,order));totals[p][l]+=g.qs.size();copied+=g.qs.size();}
        return copied;
    }
}
