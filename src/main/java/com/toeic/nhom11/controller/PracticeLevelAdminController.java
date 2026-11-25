package com.toeic.nhom11.controller;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/practice-levels")
public class PracticeLevelAdminController {
    private final PracticeLevelAdminService levels;
    public PracticeLevelAdminController(PracticeLevelAdminService levels) { this.levels=levels; }
    @PostMapping("/{skill}/{id}")
    public String assign(@PathVariable String skill,@PathVariable long id,@RequestParam(defaultValue="0") int level,
        @RequestParam(defaultValue="manual") String mode,@RequestParam(defaultValue="detail") String back, RedirectAttributes flash) {
        if(!skill.equals("listening")&&!skill.equals("reading")) throw new org.springframework.web.server.ResponseStatusException(org.springframework.http.HttpStatus.NOT_FOUND);
        try {
            if(!mode.equals("random")&&!mode.equals("manual")) throw new IllegalArgumentException("Chế độ không hợp lệ.");
            int saved=levels.assign(skill.toUpperCase(Locale.ROOT),id,level,mode.equals("random"));
            flash.addFlashAttribute("levelSuccessMessage",saved==0?"Đã bỏ cấp độ.":"Đã cập nhật cấp độ "+saved+".");
        } catch(IllegalArgumentException ex) { flash.addFlashAttribute("errorMessage",ex.getMessage()); }
        return "redirect:/admin/"+skill+(back.equals("list")?"":"/sets/"+id);
    }
}
