package com.toeic.nhom11.exam.student;

import java.security.Principal;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

/** Only /exams student routes. Does NOT register /admin/exams. */
@Controller
@RequestMapping("/exams")
public class ExamStudentController {
    private final ExamStudentService service;
    public ExamStudentController(ExamStudentService service){this.service=service;}

    @ModelAttribute
    public void common(Model model){
        model.addAttribute("activePage","exams");
        model.addAttribute("pageTitle","Thi thử TOEIC");
    }
    private static String user(Principal principal){return principal==null?null:principal.getName();}

    @GetMapping({"","/"})
    public String index(Model model){
        model.addAttribute("papers",service.papers());
        return "exams/index";
    }

    @PostMapping("/{paperId}/start")
    public String start(@PathVariable long paperId,Principal principal){
        long attemptId=service.start(paperId,user(principal));
        return "redirect:/exams/attempts/"+attemptId;
    }

    @GetMapping("/{paperId}/ready")
    public String ready(@PathVariable long paperId,Principal principal,Model model) {
        var paper=service.ready(paperId,user(principal));
        model.addAttribute("paper",paper);
        model.addAttribute("pageTitle",paper.get("title"));
        return "exams/ready";
    }

    @GetMapping("/attempts/{id}")
    public String room(@PathVariable long id,Principal principal,Model model){
        Map<String,Object> a=service.state(id,user(principal));
        if(!"IN_PROGRESS".equals(a.get("status"))) return "redirect:/exams/attempts/"+id+"/result";
        model.addAttribute("attemptId",id);
        model.addAttribute("pageTitle",a.get("title"));
        return "exams/practice";
    }

    @GetMapping("/api/attempts/{id}") @ResponseBody
    public Map<String,Object> state(@PathVariable long id,Principal principal){
        return service.state(id,user(principal));
    }
    public record AnswerRequest(Long examQuestionId,Long selectedOptionId){}
    public record SubmitRequest(Map<Long,Long> answers){}

    @PostMapping("/api/attempts/{id}/answers") @ResponseBody
    public Map<String,Object> answer(@PathVariable long id,@RequestBody AnswerRequest body,Principal principal){
        if(body==null||body.examQuestionId()==null)
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Thiếu mã câu hỏi.");
        return service.saveAnswer(id,body.examQuestionId(),body.selectedOptionId(),user(principal));
    }

    @PostMapping("/api/attempts/{id}/submit") @ResponseBody
    public Map<String,Object> submit(@PathVariable long id,@RequestBody(required=false) SubmitRequest body,Principal principal){
        return service.submit(id,user(principal),body==null?null:body.answers());
    }

    @GetMapping("/attempts/{id}/result")
    public String result(@PathVariable long id,@RequestParam(defaultValue="0") int part,
        @RequestParam(defaultValue="true") boolean needsReview,Principal principal,Model model){
        if (part<0 || part>7) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Part không hợp lệ.");
        Map<String,Object> result=service.result(id,user(principal),part,needsReview);
        model.addAttribute("result",result);
        model.addAttribute("partFilter",part);
        model.addAttribute("needsReview",needsReview);
        model.addAttribute("pageTitle","Kết quả thi thử");
        return "exams/result";
    }

    @GetMapping("/history")
    public String history(Principal principal,Model model){
        model.addAttribute("attempts",service.history(user(principal)));
        model.addAttribute("pageTitle","Lịch sử thi thử TOEIC");
        return "exams/history";
    }

    @ExceptionHandler(ResponseStatusException.class)
    public Object badRequest(ResponseStatusException ex,jakarta.servlet.http.HttpServletRequest request,Model model){
        String message=ex.getReason()==null?"Không thể xử lý yêu cầu thi thử.":ex.getReason();
        if(request.getRequestURI().contains("/exams/api/"))
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message",message));
        model.addAttribute("message",message);
        model.addAttribute("pageTitle","Thông báo thi thử");
        return new ModelAndView("exams/error",model.asMap(),HttpStatus.valueOf(ex.getStatusCode().value()));
    }
}
