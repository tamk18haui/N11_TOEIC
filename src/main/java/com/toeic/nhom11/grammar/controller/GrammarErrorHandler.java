package com.toeic.nhom11.grammar.controller;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@ControllerAdvice(assignableTypes={GrammarController.class,GrammarAdminController.class})
public class GrammarErrorHandler {
    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String invalidInput(IllegalArgumentException error,Model model) {
        model.addAttribute("pageTitle","Dữ liệu chưa hợp lệ");
        model.addAttribute("error",error.getMessage());return "grammar/error";
    }
}
