package com.toeic.nhom11.grammar.controller;

import com.toeic.nhom11.grammar.service.GrammarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/grammar")
public class GrammarController {
    private final GrammarService service;
    public GrammarController(GrammarService service) { this.service=service; }
    @ModelAttribute void common(Model model) { model.addAttribute("activePage","grammar");model.addAttribute("pageTitle","Ngữ pháp TOEIC"); }
    @GetMapping public String index(@RequestParam(defaultValue="") String q,@RequestParam(required=false) Long topic,
        @RequestParam(defaultValue="") String level,Principal user,Model model) {
        model.addAttribute("lessons",service.lessons(q,topic,level,false));model.addAttribute("topics",service.topics(false));
        model.addAttribute("q",q);model.addAttribute("selectedTopic",topic);model.addAttribute("level",level);
        var all=service.lessons(null,null,null,false);
        Map<Long,Long> counts=new HashMap<>();all.forEach(l->counts.merge(l.getTopicId(),1L,Long::sum));
        model.addAttribute("topicCounts",counts);
        var scores=user==null?Collections.<Long,java.math.BigDecimal>emptyMap():service.bestScores(user.getName());
        model.addAttribute("bestScores",scores);
        model.addAttribute("practicedCount",all.stream().filter(l->scores.containsKey(l.getId())).count());
        model.addAttribute("totalLessons",all.size());return "grammar/index";
    }
    @GetMapping("/{id}") public String detail(@PathVariable long id,@RequestParam(defaultValue="lecture") String tab,Model model) {
        var lesson=service.lesson(id,false);model.addAttribute("lesson",lesson);model.addAttribute("pageTitle",lesson.getTitle());
        model.addAttribute("tab",Set.of("lecture","examples","exercises").contains(tab)?tab:"lecture");
        model.addAttribute("examples",service.examples(id));model.addAttribute("questions",service.questions(id));return "grammar/detail";
    }
    @PostMapping("/{id}/submit") public String submit(@PathVariable long id,@RequestParam Map<String,String> params,Principal user,RedirectAttributes flash) {
        Map<Long,Long> answers=new HashMap<>();
        try {
            for(var entry:params.entrySet()) if(entry.getKey().startsWith("answer_")) answers.put(Long.parseLong(entry.getKey().substring(7)),Long.parseLong(entry.getValue()));
            long attempt=service.submit(id,user.getName(),answers);return "redirect:/grammar/attempts/"+attempt;
        } catch(IllegalArgumentException ex) {
            flash.addFlashAttribute("error",ex instanceof NumberFormatException?"Dữ liệu đáp án không hợp lệ.":ex.getMessage());return "redirect:/grammar/"+id+"?tab=exercises";
        }
    }
    @GetMapping("/attempts/{id}") public String result(@PathVariable long id,Principal user,Model model) {
        model.addAttribute("attempt",service.attempt(id,user.getName()));model.addAttribute("answers",service.answers(id,user.getName()));return "grammar/result";
    }
    @GetMapping("/history") public String history(Principal user,Model model) { model.addAttribute("attempts",service.history(user.getName()));return "grammar/history"; }
}
