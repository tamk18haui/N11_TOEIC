package com.toeic.nhom11.listening.admin;

import java.util.*;
import java.security.Principal;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Admin-only content management. /listening student route is intentionally untouched. */
@Controller
@RequestMapping("/admin/listening")
public class ListeningAdminController {
    private final ListeningAdminService service;

    public ListeningAdminController(ListeningAdminService service) { this.service=service; }

    @ModelAttribute
    void common(Model m) {
        m.addAttribute("activePage","admin-listening");
        m.addAttribute("pageTitle","Quản lý tài nguyên Listening");
    }
    private String run(Runnable action, String url, RedirectAttributes f) {
        try { action.run(); f.addFlashAttribute("successMessage","Thao tác thành công."); }
        catch (IllegalArgumentException|DataIntegrityViolationException ex) {
            f.addFlashAttribute("errorMessage",service.message(ex));
        }
        return "redirect:"+url;
    }

    @GetMapping
    public String index(@RequestParam(required=false) Integer part,Model m) {
        if(part!=null && (part<1||part>4)) part=null;
        m.addAttribute("sets",service.sets(part));
        m.addAttribute("partFilter",part);
        return "admin/listening/index";
    }
    @GetMapping("/sets/new")
    public String createForm(Model m) {
        m.addAttribute("setForm",Map.of("part_no",1,"difficulty","MEDIUM"));
        return "admin/listening/set-form";
    }
    @GetMapping("/sets/{id}/edit")
    public String editForm(@PathVariable long id,Model m) {
        m.addAttribute("setForm",service.set(id));
        return "admin/listening/set-form";
    }
    @PostMapping("/sets/save")
    public String saveSet(@RequestParam(required=false) Long id,@RequestParam int part,
                          @RequestParam String title,@RequestParam(defaultValue="") String instructions,
                          @RequestParam String difficulty,Principal principal,RedirectAttributes f) {
        try {
            long saved=service.saveSet(id,part,title,instructions,difficulty,principal.getName());
            f.addFlashAttribute("successMessage","Đã lưu bộ Listening.");
            return "redirect:/admin/listening/sets/"+saved;
        } catch(IllegalArgumentException|DataIntegrityViolationException ex) {
            f.addFlashAttribute("errorMessage",service.message(ex));
            return "redirect:/admin/listening";
        }
    }

    @GetMapping("/sets/{id}")
    public String detail(@PathVariable long id,@RequestParam(required=false) Long editPassage,Model m) {
        m.addAttribute("set",service.set(id));
        m.addAttribute("passages",service.passages(id));
        m.addAttribute("questions",service.questions(id));
        m.addAttribute("media",service.media());
        m.addAttribute("passageForm",editPassage==null?Map.of("sort_order",0):service.passage(id,editPassage));
        return "admin/listening/detail";
    }
    @PostMapping("/sets/{id}/publish")
    public String publish(@PathVariable long id,@RequestParam boolean published,RedirectAttributes f) {
        return run(()->service.publish(id,published),"/admin/listening/sets/"+id,f);
    }
    @PostMapping("/sets/{id}/delete")
    public String delete(@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deleteSet(id),"/admin/listening",f);
    }

    @PostMapping("/sets/{setId}/passages/save")
    public String savePassage(@PathVariable long setId,@RequestParam(required=false) Long id,
                              @RequestParam(defaultValue="") String transcript,
                              @RequestParam(required=false) Long audioId,@RequestParam(required=false) Long imageId,
                              @RequestParam(defaultValue="0") int sortOrder,RedirectAttributes f) {
        return run(()->service.savePassage(setId,id,transcript,audioId,imageId,sortOrder),
                "/admin/listening/sets/"+setId,f);
    }
    @PostMapping("/sets/{setId}/passages/{id}/delete")
    public String deletePassage(@PathVariable long setId,@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deletePassage(setId,id),"/admin/listening/sets/"+setId,f);
    }

    @GetMapping("/sets/{setId}/questions/new")
    public String newQuestion(@PathVariable long setId,Model m) {
        m.addAttribute("question",Map.of("sort_order",0));
        return questionForm(setId,m);
    }
    @GetMapping("/sets/{setId}/questions/{id}/edit")
    public String editQuestion(@PathVariable long setId,@PathVariable long id,Model m) {
        m.addAttribute("question",service.question(setId,id));
        var options=new LinkedHashMap<String,String>();
        String correct="";
        for(var row:service.options(id)) {
            String label=String.valueOf(row.get("option_label"));
            options.put(label,String.valueOf(row.get("option_text")));
            if(Boolean.TRUE.equals(row.get("is_correct")) || row.get("is_correct") instanceof Number n && n.intValue()==1) correct=label;
        }
        m.addAttribute("options",options);m.addAttribute("correctLabel",correct);
        return questionForm(setId,m);
    }
    private String questionForm(long setId,Model m) {
        m.addAttribute("set",service.set(setId));
        m.addAttribute("passages",service.passages(setId));
        m.addAttribute("media",service.media());
        return "admin/listening/question-form";
    }
    @PostMapping("/sets/{setId}/questions/save")
    public String saveQuestion(@PathVariable long setId,@RequestParam(required=false) Long id,
                               @RequestParam(required=false) Long passageId,
                               @RequestParam String questionText,@RequestParam(defaultValue="") String explanation,
                               @RequestParam(required=false) Long audioId,@RequestParam(required=false) Long imageId,
                               @RequestParam(defaultValue="0") int sortOrder,
                               @RequestParam(defaultValue="") String optionA,
                               @RequestParam(defaultValue="") String optionB,
                               @RequestParam(defaultValue="") String optionC,
                               @RequestParam(defaultValue="") String optionD,
                               @RequestParam(defaultValue="") String correctLabel,RedirectAttributes f) {
        var opts=Map.of("A",optionA,"B",optionB,"C",optionC,"D",optionD);
        return run(()->service.saveQuestion(setId,id,passageId,questionText,explanation,audioId,imageId,
                sortOrder,opts,correctLabel),"/admin/listening/sets/"+setId,f);
    }
    @PostMapping("/sets/{setId}/questions/{id}/delete")
    public String deleteQuestion(@PathVariable long setId,@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deleteQuestion(setId,id),"/admin/listening/sets/"+setId,f);
    }

    @GetMapping("/media")
    public String media(Model m) {
        m.addAttribute("media",service.media());
        return "admin/listening/media";
    }
    @PostMapping("/media/upload")
    public String upload(@RequestParam("file") MultipartFile file,
                         @RequestParam(required=false) Integer durationSeconds,Principal principal,RedirectAttributes f) {
        return run(()->service.addMedia(file,durationSeconds,principal.getName()),"/admin/listening/media",f);
    }
    @PostMapping("/media/{id}/delete")
    public String deleteMedia(@PathVariable long id,RedirectAttributes f) {
        return run(()->service.deleteMedia(id),"/admin/listening/media",f);
    }
}
