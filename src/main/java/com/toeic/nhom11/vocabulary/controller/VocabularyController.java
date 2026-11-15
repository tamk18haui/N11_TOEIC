package com.toeic.nhom11.vocabulary.controller;

import com.toeic.nhom11.vocabulary.model.VocabularyWord;
import com.toeic.nhom11.vocabulary.service.VocabularyService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.Map;

@Controller
@RequestMapping("/vocabulary")
public class VocabularyController {
    private final VocabularyService service;

    public VocabularyController(VocabularyService service) {
        this.service = service;
    }

    @GetMapping
    public String index(@RequestParam(defaultValue = "") String q, Principal user, Model model) {
        model.addAttribute("topics", service.topics(q, user == null ? null : user.getName()));
        model.addAttribute("q", q);
        model.addAttribute("flashcard", service.randomWord());
        model.addAttribute("activePage", "vocabulary");
        model.addAttribute("pageTitle", "Học từ vựng TOEIC");
        return "vocabulary/index";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable long id, Model model) {
        var topic = service.topic(id);
        model.addAttribute("topic", topic);
        model.addAttribute("words", service.words(id));
        model.addAttribute("activePage", "vocabulary");
        model.addAttribute("pageTitle", topic.getTitle());
        return "vocabulary/detail";
    }

    @GetMapping("/flashcard/next")
    @ResponseBody
    public Map<String, Object> nextFlashcard() {
        return flashcardData(service.randomWord());
    }

    @PostMapping("/flashcard/{wordId}/bookmark")
    @ResponseBody
    public Map<String, Object> bookmark(@PathVariable long wordId, Principal user) {
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        service.bookmark(wordId, user.getName());
        return Map.of("saved", true);
    }

    private Map<String, Object> flashcardData(VocabularyWord word) {
        return Map.of(
            "id", word.getId(),
            "word", word.getWord(),
            "phonetic", word.getPhonetic() == null ? "" : word.getPhonetic(),
            "partOfSpeech", word.getPartOfSpeech() == null ? "" : word.getPartOfSpeech(),
            "meaningVi", word.getMeaningVi(),
            "exampleSentence", word.getExampleSentence() == null ? "" : word.getExampleSentence(),
            "exampleMeaning", word.getExampleMeaning() == null ? "" : word.getExampleMeaning()
        );
    }
}
