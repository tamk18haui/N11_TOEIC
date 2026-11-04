package com.toeic.nhom11.grammar.controller;

import com.toeic.nhom11.grammar.model.QuestionReview;
import com.toeic.nhom11.grammar.service.GrammarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.math.BigDecimal;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/grammar")
public class GrammarController {
    private static final Set<String> LESSON_TABS = Set.of("lecture", "examples", "exercises");
    private static final String ANSWER_PREFIX = "answer_";

    private final GrammarService service;

    public GrammarController(GrammarService service) {
        this.service = service;
    }

    @ModelAttribute
    void common(Model model) {
        model.addAttribute("activePage", "grammar");
        model.addAttribute("pageTitle", "Ngữ pháp TOEIC");
    }

    @GetMapping
    public String index(@RequestParam(defaultValue = "") String q,
                        @RequestParam(required = false) Long topic,
                        @RequestParam(defaultValue = "") String level,
                        Principal user, Model model) {
        var allLessons = service.lessons(null, null, null, false);
        boolean filtered = !q.isBlank() || topic != null || !level.isBlank();
        var visibleLessons = filtered ? service.lessons(q, topic, level, false) : allLessons;

        // Đếm theo toàn bộ bài công khai để nhãn chủ điểm không đổi khi lọc.
        Map<Long, Long> topicCounts = new HashMap<>();
        allLessons.forEach(lesson -> topicCounts.merge(lesson.getTopicId(), 1L, Long::sum));
        Map<Long, BigDecimal> scores = user == null ? Map.of() : service.bestScores(user.getName());
        long practicedCount = allLessons.stream()
            .filter(lesson -> scores.containsKey(lesson.getId()))
            .count();

        model.addAttribute("lessons", visibleLessons);
        model.addAttribute("topics", service.topics(false));
        model.addAttribute("topicCounts", topicCounts);
        model.addAttribute("bestScores", scores);
        model.addAttribute("practicedCount", practicedCount);
        model.addAttribute("totalLessons", allLessons.size());
        model.addAttribute("q", q);
        model.addAttribute("selectedTopic", topic);
        model.addAttribute("level", level);
        return "grammar/index";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable long id,
                         @RequestParam(defaultValue = "lecture") String tab,
                         @RequestParam(defaultValue = "") String mode,
                         Model model) {
        var lesson = service.lesson(id, false);
        model.addAttribute("lesson", lesson);
        model.addAttribute("pageTitle", lesson.getTitle());
        model.addAttribute("tab", LESSON_TABS.contains(tab) ? tab : "lecture");
        model.addAttribute("examples", service.examples(id));
        model.addAttribute("questions", service.quizQuestions(id));
        model.addAttribute("mode", Set.of("practice", "exam").contains(mode) ? mode : "");
        return "grammar/detail";
    }

    @PostMapping("/{id}/practice/check")
    @ResponseBody
    public QuestionReview checkPractice(@PathVariable long id,
                                        @RequestParam long questionId,
                                        @RequestParam long optionId) {
        return service.checkPractice(id, questionId, optionId);
    }

    @PostMapping("/{id}/submit")
    public String submit(@PathVariable long id, @RequestParam Map<String, String> params,
                         Principal user, RedirectAttributes flash) {
        try {
            Map<Long, Long> answers = readAnswers(params);
            long attemptId = service.submit(id, user.getName(), answers);
            return "redirect:/grammar/attempts/" + attemptId;
        } catch (IllegalArgumentException ex) {
            String message = ex instanceof NumberFormatException
                ? "Dữ liệu đáp án không hợp lệ." : ex.getMessage();
            flash.addFlashAttribute("error", message);
            return "redirect:/grammar/" + id + "?tab=exercises&mode=exam";
        }
    }

    // JSP gửi answer_<id câu hỏi>=<id phương án>. Service xác minh và chấm các ID này.
    private Map<Long, Long> readAnswers(Map<String, String> params) {
        Map<Long, Long> answers = new HashMap<>();
        for (var entry : params.entrySet()) {
            if (entry.getKey().startsWith(ANSWER_PREFIX)) {
                long questionId = Long.parseLong(entry.getKey().substring(ANSWER_PREFIX.length()));
                answers.put(questionId, Long.parseLong(entry.getValue()));
            }
        }
        return answers;
    }

    @GetMapping("/attempts/{id}")
    public String result(@PathVariable long id, Principal user, Model model) {
        model.addAttribute("attempt", service.attempt(id, user.getName()));
        model.addAttribute("answers", service.answers(id, user.getName()));
        model.addAttribute("reviews", service.reviews(id, user.getName()));
        return "grammar/result";
    }

    @GetMapping("/history")
    public String history(Principal user, Model model) {
        model.addAttribute("attempts", service.history(user.getName()));
        return "grammar/history";
    }
}
