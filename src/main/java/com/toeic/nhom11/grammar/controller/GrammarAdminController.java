package com.toeic.nhom11.grammar.controller;

import com.toeic.nhom11.grammar.model.*;
import com.toeic.nhom11.grammar.service.GrammarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.dao.DataIntegrityViolationException;

@Controller
@RequestMapping("/admin/grammar")
public class GrammarAdminController {
    private final GrammarService service;
    public GrammarAdminController(GrammarService service) { this.service=service; }
    @ModelAttribute void common(Model m) {m.addAttribute("activePage","grammar");m.addAttribute("pageTitle","Quản trị ngữ pháp");}
    @GetMapping public String dashboard(Model m) {
        m.addAttribute("lessons",service.lessons(null,null,null,true));m.addAttribute("topics",service.topics(true));m.addAttribute("stats",service.statistics());return "grammar/admin/index";
    }
    @GetMapping("/lessons/new") public String newLesson(Model m) {
        Lesson l=new Lesson();l.setLevel("BASIC");m.addAttribute("lesson",l);m.addAttribute("topics",service.topics(true));return "grammar/admin/lesson";
    }
    @GetMapping("/lessons/{id}") public String editLesson(@PathVariable long id,Model m) {
        m.addAttribute("lesson",service.lesson(id,true));m.addAttribute("topics",service.topics(true));m.addAttribute("examples",service.examples(id));
        m.addAttribute("questions",service.questions(id));m.addAttribute("locked",service.hasAttempts(id));return "grammar/admin/lesson";
    }
    @PostMapping("/lessons/save") public String saveLesson(@ModelAttribute Lesson lesson,Model m,RedirectAttributes f) {
        try {long id=service.saveLesson(lesson);f.addFlashAttribute("success","Đã lưu bài học.");return "redirect:/admin/grammar/lessons/"+id;}
        catch(IllegalArgumentException|DataIntegrityViolationException ex) {
            m.addAttribute("lesson",lesson);m.addAttribute("topics",service.topics(true));m.addAttribute("error",message(ex));
            if(lesson.getId()!=null) {m.addAttribute("examples",service.examples(lesson.getId()));m.addAttribute("questions",service.questions(lesson.getId()));m.addAttribute("locked",service.hasAttempts(lesson.getId()));}
            return "grammar/admin/lesson";
        }
    }
    private String message(Exception e) {return e instanceof DataIntegrityViolationException?"Dữ liệu bị trùng hoặc đang được sử dụng. Vui lòng kiểm tra lại.":e.getMessage();}
    private String run(Runnable action,String back,RedirectAttributes f) {
        try {action.run();f.addFlashAttribute("success","Đã cập nhật nội dung.");}
        catch(IllegalArgumentException|DataIntegrityViolationException e) {f.addFlashAttribute("error",message(e));}return "redirect:"+back;
    }
    @PostMapping("/lessons/{id}/delete") public String deleteLesson(@PathVariable long id,RedirectAttributes f) {return run(()->service.deleteLesson(id),"/admin/grammar",f);}
    @PostMapping("/topics/save") public String saveTopic(@ModelAttribute Topic topic,RedirectAttributes f) {return run(()->service.saveTopic(topic),"/admin/grammar",f);}
    @PostMapping("/topics/{id}/delete") public String deleteTopic(@PathVariable long id,RedirectAttributes f) {return run(()->service.deleteTopic(id),"/admin/grammar",f);}
    @PostMapping("/lessons/{lessonId}/examples/save") public String saveExample(@PathVariable long lessonId,@ModelAttribute Example example,RedirectAttributes f) {
        example.setLessonId(lessonId);return run(()->service.saveExample(example),"/admin/grammar/lessons/"+lessonId,f);
    }
    @PostMapping("/lessons/{lessonId}/examples/{id}/delete") public String deleteExample(@PathVariable long lessonId,@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deleteExample(id,lessonId),"/admin/grammar/lessons/"+lessonId,f);
    }
    @GetMapping("/lessons/{lessonId}/questions/new") public String newQuestion(@PathVariable long lessonId,Model m) {
        Question q=new Question();q.setLessonId(lessonId);q.setDifficulty(1);
        for(String label:new String[]{"A","B","C","D"}) {Option o=new Option();o.setOptionLabel(label);q.getOptions().add(o);}
        return questionForm(q,m);
    }
    @GetMapping("/lessons/{lessonId}/questions/{id}") public String editQuestion(@PathVariable long lessonId,@PathVariable long id,Model m) {
        Question q=service.questions(lessonId).stream().filter(x->x.getId()==id).findFirst().orElseThrow(()->new org.springframework.web.server.ResponseStatusException(org.springframework.http.HttpStatus.NOT_FOUND));
        return questionForm(q,m);
    }
    private String questionForm(Question q,Model m) {m.addAttribute("question",q);m.addAttribute("lesson",service.lesson(q.getLessonId(),true));return "grammar/admin/question";}
    @PostMapping("/lessons/{lessonId}/questions/save") public String saveQuestion(@PathVariable long lessonId,@ModelAttribute Question q,@RequestParam(defaultValue="") String correctLabel,Model m,RedirectAttributes f) {
        q.setLessonId(lessonId);q.getOptions().forEach(o->o.setCorrect(correctLabel.equals(o.getOptionLabel())));
        try {service.saveQuestion(q);f.addFlashAttribute("success","Đã lưu câu hỏi và bốn phương án.");return "redirect:/admin/grammar/lessons/"+lessonId;}
        catch(IllegalArgumentException e) {m.addAttribute("error",e.getMessage());return questionForm(q,m);}
    }
    @PostMapping("/lessons/{lessonId}/questions/{id}/delete") public String deleteQuestion(@PathVariable long lessonId,@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deleteQuestion(id,lessonId),"/admin/grammar/lessons/"+lessonId,f);
    }
}
