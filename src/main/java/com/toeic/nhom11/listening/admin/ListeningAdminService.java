package com.toeic.nhom11.listening.admin;

import java.util.*;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/** Business rules for Listening content; leaves student-side /listening to its owner. */
@Service
public class ListeningAdminService {
    private final ListeningAdminDao dao;
    private final ListeningMediaStore store;

    public ListeningAdminService(ListeningAdminDao dao, ListeningMediaStore store) {
        this.dao = dao;
        this.store = store;
    }

    public List<Map<String,Object>> sets(Integer part) { return dao.sets(part); }
    public List<Map<String,Object>> passages(long id) { set(id); return dao.passages(id); }
    public List<Map<String,Object>> questions(long id) { set(id); return dao.questions(id); }
    public List<Map<String,Object>> media() { return dao.media(); }

    public Map<String,Object> set(long id) {
        return dao.set(id).orElseThrow(() -> new IllegalArgumentException("Không tìm thấy bộ Listening."));
    }
    public Map<String,Object> passage(long setId, long id) {
        set(setId);
        return dao.passage(setId,id).orElseThrow(() -> new IllegalArgumentException("Không tìm thấy đoạn nghe."));
    }
    public Map<String,Object> question(long setId, long id) {
        set(setId);
        return dao.question(setId,id).orElseThrow(() -> new IllegalArgumentException("Không tìm thấy câu hỏi."));
    }
    public List<Map<String,Object>> options(long questionId) { return dao.options(questionId); }

    private static String required(String input, String field, int max) {
        String value = input == null ? "" : input.trim();
        if (value.isEmpty() || value.length()>max) throw new IllegalArgumentException(field + " không hợp lệ (tối đa " + max + " ký tự).");
        return value;
    }
    private static String optional(String value, int max) {
        String text = value == null ? "" : value.trim();
        if (text.length()>max) throw new IllegalArgumentException("Nội dung vượt quá " + max + " ký tự.");
        return text.isEmpty()? null:text;
    }
    private static boolean yes(Object value) {
        return Boolean.TRUE.equals(value) || (value instanceof Number && ((Number)value).intValue()!=0)
                || "true".equalsIgnoreCase(String.valueOf(value));
    }
    private void editable(long id) {
        var s = set(id);
        if (yes(s.get("is_published"))) throw new IllegalArgumentException("Hãy chuyển bộ này về bản nháp trước khi chỉnh sửa.");
        if (((Number)s.get("attempt_count")).longValue()>0) throw new IllegalArgumentException("Bộ đã có lượt làm bài; không được sửa nội dung để bảo toàn lịch sử chấm điểm.");
    }
    private void verifyMedia(Long id, String expected) {
        if (id==null) return;
        var item=dao.media(id).orElseThrow(()->new IllegalArgumentException("Tài nguyên không tồn tại hoặc không thuộc Listening."));
        if (!expected.equals(item.get("media_type"))) throw new IllegalArgumentException("Tài nguyên phải thuộc loại " + expected + ".");
    }
    private void verifyPassage(long setId, Long passageId) {
        if (passageId!=null) passage(setId,passageId);
    }
    private static void order(int n) {
        if(n<0 || n>100000) throw new IllegalArgumentException("Thứ tự phải từ 0 đến 100000.");
    }
    private static void part(int n) {
        if(n<1 || n>4) throw new IllegalArgumentException("Listening chỉ có Part 1 đến Part 4.");
    }

    @Transactional
    public long saveSet(Long id, int part, String title, String instructions, String difficulty, String adminEmail) {
        part(part);
        title = required(title,"Tên bộ nghe",200);
        instructions = optional(instructions,10000);
        if (!Set.of("EASY","MEDIUM","HARD").contains(difficulty)) throw new IllegalArgumentException("Độ khó không hợp lệ.");
        if (id==null) return dao.addSet(part,title,instructions,difficulty,dao.adminId(adminEmail));
        editable(id);
        dao.updateSet(id,part,title,instructions,difficulty);
        return id;
    }

    @Transactional
    public void publish(long id, boolean publish) {
        var s=set(id);
        if (publish) {
            if (dao.count(id,"practice_questions")==0) throw new IllegalArgumentException("Cần ít nhất một câu hỏi trước khi công bố.");
            long invalid=dao.countInvalidQuestions(id,((Number)s.get("part_no")).intValue());
            if(invalid>0) throw new IllegalArgumentException("Có "+invalid+" câu thiếu đáp án theo Part (Part 2: 3; Part 1/3/4: 4), đáp án đúng, audio hoặc ảnh (Part 1).");
        }
        dao.publish(id,publish);
    }

    @Transactional
    public void deleteSet(long id) {
        editable(id);
        if (dao.count(id,"practice_questions")>0 || dao.count(id,"practice_passages")>0)
            throw new IllegalArgumentException("Chỉ xóa được bộ nháp trống; hãy xóa câu hỏi và đoạn nghe trước.");
        dao.deleteSet(id);
    }

    @Transactional
    public void savePassage(long setId, Long id, String transcript, Long audio, Long image, int sort) {
        editable(setId);
        if(id!=null) passage(setId,id);
        order(sort);
        verifyMedia(audio,"AUDIO");verifyMedia(image,"IMAGE");
        String text=optional(transcript,200000);
        if(text==null && audio==null && image==null) throw new IllegalArgumentException("Đoạn nghe cần transcript, audio hoặc hình ảnh.");
        dao.savePassage(id,setId,text,audio,image,sort);
    }
    @Transactional
    public void deletePassage(long setId,long id) {
        editable(setId);passage(setId,id);
        dao.deletePassage(setId,id); // FK blocks deletion when questions reference this passage.
    }

    @Transactional
    public void saveQuestion(long setId, Long id, Long passageId, String text, String explanation,
                             Long audio, Long image, int sort, Map<String,String> raw, String correct) {
        editable(setId);
        if(id!=null) question(setId,id);
        verifyPassage(setId,passageId);
        verifyMedia(audio,"AUDIO");verifyMedia(image,"IMAGE");order(sort);
        text=required(text,"Nội dung câu hỏi",30000);
        explanation=optional(explanation,30000);
        Map<String,String> options = new LinkedHashMap<>();
        for (String label: List.of("A","B","C","D")) {
            String value=optional(raw.get(label),30000);
            if(value!=null) options.put(label,value);
        }
        int partNo=((Number)set(setId).get("part_no")).intValue();
        int expected=partNo==2?3:4;
        if(options.size()!=expected || !options.containsKey("A") || !options.containsKey("B") || !options.containsKey("C"))
            throw new IllegalArgumentException("Part "+partNo+" cần đúng "+expected+" đáp án (A–C hoặc A–D).");
        if (!options.containsKey(correct)) throw new IllegalArgumentException("Hãy chọn đáp án đúng đã nhập.");
        long qid=dao.saveQuestion(id,setId,passageId,text,explanation,audio,image,sort);
        dao.replaceOptions(qid,options,correct);
    }
    @Transactional
    public void deleteQuestion(long setId, long id) {
        editable(setId);question(setId,id);
        dao.deleteQuestion(setId,id);
    }

    @Transactional
    public void addMedia(MultipartFile upload, Integer duration, String adminEmail) {
        if(duration!=null && (duration<0 || duration>86400)) throw new IllegalArgumentException("Thời lượng phải từ 0 đến 86400 giây.");
        var stored=store.save(upload);
        try {
            dao.addMedia(stored.type(), stored.url(),stored.mime(),duration==null?null:duration.longValue(),dao.adminId(adminEmail));
        } catch (RuntimeException e) {
            store.remove(stored.url());
            throw e;
        }
    }
    @Transactional
    public void deleteMedia(long id) {
        var m=dao.media(id).orElseThrow(()->new IllegalArgumentException("Không tìm thấy tài nguyên Listening."));
        // Foreign keys prevent removing media still referenced by Listening or any other module.
        dao.deleteMedia(id);
        store.remove(String.valueOf(m.get("file_url")));
    }

    public String message(Exception ex) {
        if(ex instanceof DataIntegrityViolationException) return "Không thể xóa hoặc cập nhật: dữ liệu đang được câu hỏi/bài thi tham chiếu.";
        if(ex instanceof IllegalArgumentException) return ex.getMessage();
        return "Thao tác thất bại. Vui lòng kiểm tra nhật ký hệ thống.";
    }
}
