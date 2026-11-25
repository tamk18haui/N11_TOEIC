package com.toeic.nhom11.reading.admin;

import java.security.Principal;
import java.util.*;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Admin routes are protected by SecurityConfig /admin/** ROLE_ADMIN rule. */
@Controller
@RequestMapping("/admin/reading")
public class ReadingAdminController {
    private final ReadingAdminService service;
    private final com.toeic.nhom11.controller.QuestionLevelRouter questionLevels;
    public ReadingAdminController(ReadingAdminService service, com.toeic.nhom11.controller.QuestionLevelRouter questionLevels) { this.service=service; this.questionLevels=questionLevels; }

    @ModelAttribute void common(Model m) {
        m.addAttribute("activePage","admin-reading");
        m.addAttribute("pageTitle","Quản lý Reading");
    }
    private String errorText(Exception ex) {
        if(ex instanceof DataIntegrityViolationException) return "Không thể sửa/xóa: dữ liệu đang được bài làm tham chiếu.";
        if(ex instanceof IllegalArgumentException) return Objects.toString(ex.getMessage(), "Dữ liệu không hợp lệ.");
        return "Không thể xử lý yêu cầu.";
    }
    private String change(Runnable action,String success,String back,RedirectAttributes flash) {
        try {action.run();flash.addFlashAttribute("successMessage",success);}
        catch (IllegalArgumentException|DataIntegrityViolationException ex) {flash.addFlashAttribute("errorMessage",errorText(ex));}
        return "redirect:"+back;
    }
    @GetMapping
    public String index(@RequestParam(required=false) Integer part,Model model) {
        if(part!=null && (part<5 || part>7)) part=null;
        model.addAttribute("sets",service.sets(part));model.addAttribute("partFilter",part);
        return "admin/reading/index";
    }
    @GetMapping("/sets/new")
    public String create(Model model) {
        model.addAttribute("setForm", Map.of("part_no",5,"level",0,"difficulty","MEDIUM","title","","instructions_clean",""));
        return "admin/reading/set-form";
    }
    @GetMapping("/sets/{id}/edit")
    public String edit(@PathVariable long id,Model model) {
        model.addAttribute("setForm",service.set(id));return "admin/reading/set-form";
    }
    @PostMapping("/sets/save")
    public String save(@RequestParam(required=false) Long id,@RequestParam int part,@RequestParam int level,
                       @RequestParam String title,@RequestParam(defaultValue="") String instructions,
                       @RequestParam String difficulty,Principal principal,RedirectAttributes flash) {
        try {
            long saved=service.saveSet(id,part,level,title,instructions,difficulty,principal.getName());
            flash.addFlashAttribute("successMessage","Đã lưu bộ Reading.");
            return "redirect:/admin/reading/sets/"+saved;
        } catch (IllegalArgumentException|DataIntegrityViolationException ex) {
            flash.addFlashAttribute("errorMessage",errorText(ex));
            return id == null ? "redirect:/admin/reading/sets/new" : "redirect:/admin/reading/sets/"+id+"/edit";
        }
    }
    @GetMapping("/sets/{id}")
    public String detail(@PathVariable long id,Model model) {
        model.addAttribute("set",service.set(id));
        model.addAttribute("passages",service.passages(id));
        model.addAttribute("questions",service.questions(id));
        return "admin/reading/detail";
    }
    @PostMapping("/sets/{id}/publish")
    public String publish(@PathVariable long id,@RequestParam boolean published,RedirectAttributes flash) {
        return change(()->service.publish(id,published),"Đã cập nhật trạng thái công bố.","/admin/reading/sets/"+id,flash);
    }
    @PostMapping("/api/sets/{id}/publish") @ResponseBody
    public ResponseEntity<Map<String,Object>> ajaxPublish(@PathVariable long id,@RequestParam boolean published) {
        try {
            service.publish(id,published);
            return ResponseEntity.ok(Map.of("id",id,"published",published,
                "message",published?"Đã công bố bộ Reading.":"Đã chuyển về bản nháp."));
        } catch (IllegalArgumentException|DataIntegrityViolationException ex) {
            return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(Map.of("message",errorText(ex)));
        }
    }
    @PostMapping("/sets/{id}/delete")
    public String delete(@PathVariable long id,RedirectAttributes flash) {
        return change(()->service.deleteSet(id),"Đã xóa bộ nháp.","/admin/reading",flash);
    }
    @PostMapping("/sets/{id}/passages/save")
    public String savePassage(@PathVariable long id,@RequestParam(required=false) Long passageId,
                              @RequestParam String title,@RequestParam String body,
                              @RequestParam(defaultValue="0") int sortOrder,RedirectAttributes flash) {
        return change(()->service.savePassage(id,passageId,title,body,sortOrder),"Đã lưu đoạn đọc.","/admin/reading/sets/"+id,flash);
    }
    @PostMapping("/sets/{id}/passages/{passageId}/delete")
    public String deletePassage(@PathVariable long id,@PathVariable long passageId,RedirectAttributes flash) {
        return change(()->service.deletePassage(id,passageId),"Đã xóa đoạn đọc.","/admin/reading/sets/"+id,flash);
    }
    private String questionForm(long id,Model model) {
        model.addAttribute("set",service.set(id));model.addAttribute("passages",service.passages(id));
        return "admin/reading/question-form";
    }
    @GetMapping("/sets/{id}/questions/new")
    public String createQuestion(@PathVariable long id,Model model) {
        model.addAttribute("question",Map.of("sort_order",0,"question_text","","explanation",""));
        return questionForm(id,model);
    }
    @GetMapping("/sets/{id}/questions/{qid}/edit")
    public String editQuestion(@PathVariable long id,@PathVariable long qid,Model model) {
        model.addAttribute("question",service.question(id,qid));return questionForm(id,model);
    }
    @PostMapping("/sets/{id}/questions/save")
    public String saveQuestion(@PathVariable long id,@RequestParam(required=false) Long questionId,
                               @RequestParam(required=false) Long passageId,@RequestParam String questionText,
                               @RequestParam(defaultValue="") String explanation,@RequestParam(defaultValue="0") int sortOrder,
                               @RequestParam String optionA,@RequestParam String optionB,@RequestParam String optionC,
                               @RequestParam String optionD,@RequestParam String correctLabel,@RequestParam(defaultValue="-1") int questionLevel,RedirectAttributes flash) {
        try {
            long destination=questionLevels.save("READING",id,questionLevel,()->service.saveQuestion(id,questionId,passageId,questionText,explanation,sortOrder,optionA,optionB,optionC,optionD,correctLabel));
            flash.addFlashAttribute("successMessage","Đã lưu câu hỏi.");
            return "redirect:/admin/reading/sets/"+destination;
        } catch(IllegalArgumentException|DataIntegrityViolationException ex){
            flash.addFlashAttribute("errorMessage",errorText(ex));
            return "redirect:/admin/reading/sets/"+id;
        }
    }
    @PostMapping("/sets/{id}/questions/{qid}/delete")
    public String deleteQuestion(@PathVariable long id,@PathVariable long qid,RedirectAttributes flash) {
        return change(()->service.deleteQuestion(id,qid),"Đã xóa câu hỏi.","/admin/reading/sets/"+id,flash);
    }
}
