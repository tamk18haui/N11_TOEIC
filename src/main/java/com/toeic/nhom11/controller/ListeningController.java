package com.toeic.nhom11.controller;

import com.toeic.nhom11.model.ListeningSubmission;
import com.toeic.nhom11.service.ListeningService;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

/** The existing UiPageController still owns GET /listening; no duplicate mapping. */
@Controller
@RequestMapping("/listening")
public class ListeningController {
    private final ListeningService listening;
    public ListeningController(ListeningService listening) {this.listening=listening;}

    @GetMapping("/practice/{setId}")
    public String practice(@PathVariable long setId,Model model) {
        // Validate the requested set before rendering the practice view.
        var exercise=listening.exercise(setId);
        model.addAttribute("setId",setId);
        model.addAttribute("part",exercise.get("part"));
        model.addAttribute("activePage","listening");
        model.addAttribute("pageTitle",exercise.get("title"));
        return "listening/practice";
    }

    @GetMapping("/api/overview") @ResponseBody
    public Map<String,Object> overview(@RequestParam(defaultValue="1") int part,Principal principal) {
        return listening.overview(part,principal==null?null:principal.getName());
    }

    @GetMapping("/api/sets/{setId}") @ResponseBody
    public Map<String,Object> exercise(@PathVariable long setId) {return listening.exercise(setId);}

    @PostMapping("/api/sets/{setId}/start") @ResponseBody
    public Map<String,Object> start(@PathVariable long setId,Principal principal) {
        return listening.startPractice(setId,principal==null?null:principal.getName());
    }

    @PostMapping("/api/sets/{setId}/restart") @ResponseBody
    public Map<String,Object> restart(@PathVariable long setId,Principal principal) {
        return listening.restartPractice(setId,principal==null?null:principal.getName());
    }

    public record AnswerRequest(Long questionId,Long optionId) {}

    @PostMapping("/api/sets/{setId}/attempts/{attemptId}/check") @ResponseBody
    public Map<String,Object> check(@PathVariable long setId,@PathVariable long attemptId,
        @RequestBody AnswerRequest form,Principal principal) {
        if(form==null||form.questionId()==null||form.optionId()==null)
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Thiếu câu hỏi hoặc đáp án.");
        return listening.checkAnswer(setId,attemptId,form.questionId(),form.optionId(),
            principal==null?null:principal.getName());
    }

    @PostMapping("/api/sets/{setId}/attempts/{attemptId}/groups/{questionId}/check") @ResponseBody
    public Map<String,Object> checkGroup(@PathVariable long setId,@PathVariable long attemptId,
        @PathVariable long questionId,@RequestBody ListeningSubmission form,Principal principal) {
        return listening.checkGroup(setId,attemptId,questionId,form,principal==null?null:principal.getName());
    }

    @GetMapping("/api/sets/{setId}/attempts/{attemptId}") @ResponseBody
    public Map<String,Object> viewAttempt(@PathVariable long setId,@PathVariable long attemptId,Principal principal) {
        return listening.viewAttempt(setId,attemptId,principal==null?null:principal.getName());
    }

    @PostMapping("/api/sets/{setId}/submit") @ResponseBody
    public Map<String,Object> submit(@PathVariable long setId,@RequestBody ListeningSubmission form,Principal principal) {
        return listening.submit(setId,form,principal==null?null:principal.getName());
    }

    @GetMapping("/api/history") @ResponseBody
    public List<Map<String,Object>> history(Principal principal) {
        return listening.history(principal==null?null:principal.getName());
    }

    @ExceptionHandler(ResponseStatusException.class)
    public Object handle(ResponseStatusException ex,jakarta.servlet.http.HttpServletRequest request,Model model) {
        String message=ex.getReason()==null?"Yêu cầu Listening không hợp lệ.":ex.getReason();
        if(request.getRequestURI().contains("/api/"))
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message",message));
        model.addAttribute("message",message);model.addAttribute("activePage","listening");
        model.addAttribute("pageTitle","Không tìm thấy bài luyện");
        return new org.springframework.web.servlet.ModelAndView("listening/error",model.asMap(),HttpStatus.valueOf(ex.getStatusCode().value()));
    }
}
