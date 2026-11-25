package com.toeic.nhom11.controller;

import com.toeic.nhom11.service.StudyTrackingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;
import java.time.LocalDate;
import java.util.*;

/** Controller riêng cho lộ trình và thống kê. SecurityConfig hiện có bảo vệ /admin/** và các trang học viên. */
@Controller
public class StudyTrackingController {
    private final StudyTrackingService service;
    public StudyTrackingController(StudyTrackingService service){this.service=service;}
    private void page(Model m,String active,String title){m.addAttribute("activePage",active);m.addAttribute("pageTitle",title);}
    private String action(Runnable r,RedirectAttributes flash,String dest){try{r.run();flash.addFlashAttribute("successMessage","Đã lưu thay đổi.");}catch(IllegalArgumentException e){flash.addFlashAttribute("errorMessage",e.getMessage());}return "redirect:"+dest;}
    private long uid(Authentication auth){if(auth==null)throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);try{return service.studentId(auth.getName());}catch(IllegalArgumentException e){throw new ResponseStatusException(HttpStatus.FORBIDDEN);}}
    @GetMapping("/admin/roadmap") public String adminRoadmap(Model m){page(m,"admin-roadmap","Quản lý lộ trình học");m.addAttribute("plans",service.plans(null));m.addAttribute("students",service.students());m.addAttribute("today",LocalDate.now());m.addAttribute("endDate",LocalDate.now().plusDays(56));return "admin/roadmap/index";}
    @GetMapping("/admin/roadmap/{id}") public String detail(@PathVariable long id,Model m){page(m,"admin-roadmap","Chi tiết lộ trình");try{m.addAttribute("plan",service.plan(id));}catch(IllegalArgumentException e){throw new ResponseStatusException(HttpStatus.NOT_FOUND);}m.addAttribute("items",service.items(id));m.addAttribute("catalog",service.catalog());return "admin/roadmap/detail";}
    @PostMapping("/admin/roadmap") public String create(@RequestParam long userId,@RequestParam String title,@RequestParam int score,@RequestParam @DateTimeFormat(iso=DateTimeFormat.ISO.DATE) LocalDate start,@RequestParam @DateTimeFormat(iso=DateTimeFormat.ISO.DATE) LocalDate end,RedirectAttributes f){return action(()->service.create(userId,title,score,start,end),f,"/admin/roadmap");}
    @PostMapping("/admin/roadmap/{id}/edit") public String edit(@PathVariable long id,@RequestParam String title,@RequestParam int score,@RequestParam @DateTimeFormat(iso=DateTimeFormat.ISO.DATE) LocalDate start,@RequestParam @DateTimeFormat(iso=DateTimeFormat.ISO.DATE) LocalDate end,@RequestParam String status,RedirectAttributes f){return action(()->service.edit(id,title,score,start,end,status),f,"/admin/roadmap/"+id);}
    @PostMapping("/admin/roadmap/{id}/items") public String add(@PathVariable long id,@RequestParam String choice,@RequestParam int order,@RequestParam(required=false) @DateTimeFormat(iso=DateTimeFormat.ISO.DATE) LocalDate due,RedirectAttributes f){return action(()->service.add(id,choice,order,due),f,"/admin/roadmap/"+id);}
    @PostMapping("/admin/roadmap/{id}/items/{item}/remove") public String remove(@PathVariable long id,@PathVariable long item,RedirectAttributes f){return action(()->service.remove(id,item),f,"/admin/roadmap/"+id);}
    @PostMapping("/admin/roadmap/{id}/items/{item}/order") public String order(@PathVariable long id,@PathVariable long item,@RequestParam int order,RedirectAttributes f){return action(()->service.reorder(id,item,order),f,"/admin/roadmap/"+id);}
    @GetMapping("/roadmap") public String roadmap(Authentication auth,Model m){long user=uid(auth);page(m,"roadmap","Lộ trình học");var plans=service.plans(user);for(var p:plans){long id=((Number)p.get("id")).longValue();p.put("tasks",service.items(id));}m.addAttribute("plans",plans);return "roadmap/index";}
    @PostMapping("/roadmap/items/{item}") public String mark(Authentication auth,@PathVariable long item,@RequestParam boolean done,RedirectAttributes f){long user=uid(auth);return action(()->service.mark(user,item,done),f,"/roadmap");}
    private void stats(Model m,Long user,int days){m.addAttribute("days",days==7||days==30?days:0);m.addAttribute("totals",service.totals(user,days));m.addAttribute("skills",service.skills(user,days));var daily=service.daily(user);m.addAttribute("daily",daily);m.addAttribute("dailyMax",daily.stream().mapToLong(d->((Number)d.get("attempts")).longValue()).max().orElse(1));}
    @GetMapping("/admin/progress") public String adminProgress(@RequestParam(defaultValue="30") int days,@RequestParam(defaultValue="") String q,@RequestParam(defaultValue="0") int p,Model m){page(m,"admin-progress","Tiến độ & thống kê");stats(m,null,days);int n=Math.max(0,Math.min(p,100000));m.addAttribute("students",service.byStudent(days,q,n));m.addAttribute("studentCount",service.studentCount());m.addAttribute("q",q);m.addAttribute("p",n);return "admin/progress/index";}
    @GetMapping("/progress") public String progress(Authentication auth,@RequestParam(defaultValue="30") int days,Model m){long user=uid(auth);page(m,"progress","Tiến độ học tập");stats(m,user,days);m.addAttribute("mastered",service.mastered(user));return "progress/index";}
}
