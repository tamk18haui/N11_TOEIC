package com.toeic.nhom11.exam.admin;

import java.security.Principal;
import java.util.*;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Chỉ /admin/exams; SecurityConfig hiện có yêu cầu ROLE_ADMIN và CSRF cho POST. */
@Controller
@RequestMapping("/admin/exams")
public class ExamAdminController {
    private final ExamAdminService service;
    public ExamAdminController(ExamAdminService service){this.service=service;}
    @ModelAttribute void common(Model m){m.addAttribute("activePage","admin-exams");m.addAttribute("pageTitle","Quản lý đề thi");}
    private Map<String,Object> paper(long id){try{return service.paper(id);}catch(IllegalArgumentException e){throw new ResponseStatusException(HttpStatus.NOT_FOUND);}}
    private String back(long id){return "/admin/exams/"+id;}
    private String action(Runnable r,String destination,RedirectAttributes f){try{r.run();f.addFlashAttribute("successMessage","Đã lưu thay đổi.");}catch(IllegalArgumentException e){f.addFlashAttribute("errorMessage",e.getMessage());}catch(DataIntegrityViolationException e){f.addFlashAttribute("errorMessage","Không thể cập nhật: dữ liệu đang được tham chiếu hoặc đã thay đổi. Vui lòng tải lại.");}return "redirect:"+destination;}
    @GetMapping public String index(@RequestParam(defaultValue="") String q,@RequestParam(defaultValue="all") String status,Model m){q=q.strip();if(q.length()>220)q=q.substring(0,220);m.addAttribute("q",q);m.addAttribute("status",status);m.addAttribute("papers",service.papers(q,status));return "admin/exams";}
    @PostMapping public String create(@RequestParam String title,@RequestParam(defaultValue="") String description,@RequestParam String type,@RequestParam int duration,Principal principal,RedirectAttributes f){try{long id=service.create(title,description,type,duration,principal.getName());f.addFlashAttribute("successMessage","Đã tạo đề nháp. Hãy chọn câu hỏi.");return "redirect:"+back(id);}catch(IllegalArgumentException e){f.addFlashAttribute("errorMessage",e.getMessage());return "redirect:/admin/exams";}}
    @GetMapping("/{id}") public String detail(@PathVariable long id,@RequestParam(defaultValue="1") int part,@RequestParam(defaultValue="") String q,@RequestParam(defaultValue="0") int page,Model m){var e=paper(id);part=Math.max(1,Math.min(7,part));page=Math.max(0,Math.min(10000,page));if(q.length()>220)q=q.substring(0,220);m.addAttribute("paper",e);m.addAttribute("distribution",service.distribution(id));m.addAttribute("groups",service.selectedGroups(id));m.addAttribute("part",part);m.addAttribute("q",q);m.addAttribute("page",page);boolean editable=!(Boolean.TRUE.equals(e.get("is_published"))||e.get("is_published") instanceof Number n&&n.intValue()!=0)&&((Number)e.get("attempt_count")).longValue()==0;m.addAttribute("editable",editable);if(editable){var rows=service.candidates(id,part,q,page);m.addAttribute("candidates",rows.stream().limit(40).toList());m.addAttribute("more",rows.size()>40);}m.addAttribute("listeningScale",service.scaleText(id,"LISTENING"));m.addAttribute("readingScale",service.scaleText(id,"READING"));return "admin/exam/detail";}
    @PostMapping("/{id}/edit") public String edit(@PathVariable long id,@RequestParam String title,@RequestParam(defaultValue="") String description,@RequestParam String type,@RequestParam int duration,RedirectAttributes f){return action(()->service.edit(id,title,description,type,duration),back(id),f);}
    @PostMapping("/{id}/add") public String add(@PathVariable long id,@RequestParam int part,@RequestParam(required=false) List<Long> groupIds,RedirectAttributes f){return action(()->service.add(id,part,groupIds),back(id)+"?part="+Math.max(1,Math.min(7,part)),f);}
    @PostMapping("/{id}/random") public String random(@PathVariable long id,@RequestParam int part,@RequestParam int amount,RedirectAttributes f){return action(()->service.random(id,part,amount),back(id)+"?part="+Math.max(1,Math.min(7,part)),f);}
    @PostMapping("/{id}/generate") public String generate(@PathVariable long id,RedirectAttributes f){return action(()->service.generateFull(id),back(id),f);}
    @PostMapping("/{id}/remove") public String remove(@PathVariable long id,@RequestParam long question,RedirectAttributes f){return action(()->service.remove(id,question),back(id),f);}
    @PostMapping("/{id}/publish") public String publish(@PathVariable long id,@RequestParam boolean published,RedirectAttributes f){return action(()->service.publish(id,published),back(id),f);}
    // N11 V43: each paper is synchronized in its own transaction. Failures are reported separately.
    @PostMapping("/sync-practice") public String syncPractice(RedirectAttributes f){int copied=0,ok=0;var errors=new ArrayList<String>();for(var p:service.papers("","published")){long id=((Number)p.get("id")).longValue();try{copied+=service.syncPublishedPractice(id);ok++;}catch(IllegalArgumentException|DataIntegrityViolationException ex){errors.add("#"+id+": "+(ex instanceof IllegalArgumentException?ex.getMessage():"Lỗi ràng buộc CSDL"));}}f.addFlashAttribute("successMessage","Đã xử lý "+ok+" đề công bố, thêm "+copied+" câu luyện tập mới (câu trùng được bỏ qua).");if(!errors.isEmpty())f.addFlashAttribute("errorMessage",String.join("; ",errors));return "redirect:/admin/exams";}
    @PostMapping("/{id}/delete") public String delete(@PathVariable long id,RedirectAttributes f){return action(()->service.delete(id),"/admin/exams",f);}
    @PostMapping("/{id}/scales") public String scales(@PathVariable long id,@RequestParam(defaultValue="") String listening,@RequestParam(defaultValue="") String reading,RedirectAttributes f){return action(()->service.scales(id,listening,reading),back(id),f);}
    @GetMapping("/{id}/preview") public String preview(@PathVariable long id,Model m){m.addAttribute("paper",paper(id));m.addAttribute("questions",service.preview(id));return "admin/exam/preview";}
}
