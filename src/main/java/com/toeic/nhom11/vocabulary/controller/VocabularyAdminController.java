package com.toeic.nhom11.vocabulary.controller;

import com.toeic.nhom11.vocabulary.model.VocabularyLesson;
import com.toeic.nhom11.vocabulary.model.VocabularyTerm;
import com.toeic.nhom11.vocabulary.model.VocabularyTopic;
import com.toeic.nhom11.vocabulary.service.VocabularyService;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/vocabulary")
public class VocabularyAdminController {
    private final VocabularyService service;

    public VocabularyAdminController(VocabularyService service) {
        this.service = service;
    }

    @ModelAttribute
    void common(Model model) {
        model.addAttribute("activePage", "vocabulary");
        model.addAttribute("pageTitle", "Quản trị từ vựng");
    }

    @GetMapping
    public String dashboard(Model model) {
        model.addAttribute("topics", service.topics(true));
        model.addAttribute("stats", service.statistics());
        return "vocabulary/admin/index";
    }

    @GetMapping("/topics/new")
    public String newTopic(Model model) {
        VocabularyTopic topic = new VocabularyTopic();
        topic.setLevel("BASIC");
        model.addAttribute("topic", topic);
        return "vocabulary/admin/topic";
    }

    @GetMapping("/topics/{id}")
    public String editTopic(@PathVariable long id, Model model) {
        model.addAttribute("topic", service.topic(id, true));
        model.addAttribute("lessons", service.lessons(id));
        model.addAttribute("terms", service.terms(id));
        return "vocabulary/admin/topic";
    }

    @PostMapping("/topics/save")
    public String saveTopic(@ModelAttribute VocabularyTopic topic, Model model,
                            RedirectAttributes redirect) {
        try {
            long id = service.saveTopic(topic);
            redirect.addFlashAttribute("success", "Đã lưu chủ đề từ vựng.");
            return "redirect:/admin/vocabulary/topics/" + id;
        } catch (IllegalArgumentException | DataIntegrityViolationException exception) {
            model.addAttribute("topic", topic);
            model.addAttribute("error", message(exception));
            return "vocabulary/admin/topic";
        }
    }

    @PostMapping("/topics/{id}/delete")
    public String deleteTopic(@PathVariable long id, RedirectAttributes redirect) {
        return run(() -> service.deleteTopic(id), redirect);
    }

    @GetMapping("/topics/{topicId}/lessons/new")
    public String newLesson(@PathVariable long topicId, Model model) {
        VocabularyLesson lesson = new VocabularyLesson();
        lesson.setTopicId(topicId);
        lesson.setTargetWordCount(10);
        return lessonForm(lesson, model);
    }

    @GetMapping("/topics/{topicId}/lessons/{id}")
    public String editLesson(@PathVariable long topicId, @PathVariable long id, Model model) {
        VocabularyLesson lesson = service.lessons(topicId).stream()
            .filter(item -> item.getId() != null && item.getId() == id)
            .findFirst()
            .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                org.springframework.http.HttpStatus.NOT_FOUND));
        return lessonForm(lesson, model);
    }

    @PostMapping("/lessons/save")
    public String saveLesson(@ModelAttribute VocabularyLesson lesson, Model model,
                             RedirectAttributes redirect) {
        try {
            long id = service.saveLesson(lesson);
            redirect.addFlashAttribute("success", "Đã lưu bài học từ vựng.");
            return "redirect:/admin/vocabulary/topics/" + lesson.getTopicId()
                + "/lessons/" + id;
        } catch (IllegalArgumentException | DataIntegrityViolationException exception) {
            model.addAttribute("error", message(exception));
            return lessonForm(lesson, model);
        }
    }

    @PostMapping("/topics/{topicId}/lessons/{id}/delete")
    public String deleteLesson(@PathVariable long topicId, @PathVariable long id,
                               RedirectAttributes redirect) {
        run(() -> service.deleteLesson(id), redirect);
        return "redirect:/admin/vocabulary/topics/" + topicId;
    }

    @GetMapping("/topics/{topicId}/terms/new")
    public String newTerm(@PathVariable long topicId, Model model) {
        VocabularyTerm term = new VocabularyTerm();
        term.setTopicId(topicId);
        model.addAttribute("term", term);
        model.addAttribute("topic", service.topic(topicId, true));
        return "vocabulary/admin/term";
    }

    @GetMapping("/topics/{topicId}/terms/{id}")
    public String editTerm(@PathVariable long topicId, @PathVariable long id, Model model) {
        VocabularyTerm term = service.term(id);
        if (term.getTopicId() != topicId) {
            throw new org.springframework.web.server.ResponseStatusException(
                org.springframework.http.HttpStatus.NOT_FOUND);
        }
        model.addAttribute("term", term);
        model.addAttribute("topic", service.topic(topicId, true));
        return "vocabulary/admin/term";
    }

    @PostMapping("/terms/save")
    public String saveTerm(@ModelAttribute VocabularyTerm term, Model model,
                           RedirectAttributes redirect) {
        try {
            service.saveTerm(term);
            redirect.addFlashAttribute("success", "Đã lưu từ vựng.");
            return "redirect:/admin/vocabulary/topics/" + term.getTopicId();
        } catch (IllegalArgumentException | DataIntegrityViolationException exception) {
            model.addAttribute("error", message(exception));
            model.addAttribute("term", term);
            model.addAttribute("topic", service.topic(term.getTopicId(), true));
            return "vocabulary/admin/term";
        }
    }

    @PostMapping("/topics/{topicId}/terms/{id}/delete")
    public String deleteTerm(@PathVariable long topicId, @PathVariable long id,
                             RedirectAttributes redirect) {
        VocabularyTerm term = service.term(id);
        if (term.getTopicId() != topicId) {
            throw new org.springframework.web.server.ResponseStatusException(
                org.springframework.http.HttpStatus.NOT_FOUND);
        }
        run(() -> service.deleteTerm(id), redirect);
        return "redirect:/admin/vocabulary/topics/" + topicId;
    }

    private String lessonForm(VocabularyLesson lesson, Model model) {
        model.addAttribute("lesson", lesson);
        model.addAttribute("topic", service.topic(lesson.getTopicId(), true));
        return "vocabulary/admin/lesson";
    }

    private String run(Runnable action, RedirectAttributes redirect) {
        try {
            action.run();
            redirect.addFlashAttribute("success", "Đã cập nhật nội dung.");
        } catch (IllegalArgumentException | DataIntegrityViolationException exception) {
            redirect.addFlashAttribute("error", message(exception));
        }
        return "redirect:/admin/vocabulary";
    }

    private String message(Exception exception) {
        return exception instanceof DataIntegrityViolationException
            ? "Dữ liệu đang được sử dụng. Hãy kiểm tra liên kết, tiến độ hoặc lịch sử làm bài."
            : exception.getMessage();
    }
}
