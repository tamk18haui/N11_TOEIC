package com.toeic.nhom11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller cho khung giao dien minh hoa (chua co DAO va xu ly POST).
 * Khi cac thanh vien trien khai nghiep vu that, thay the/cap nhat mapping
 * trong controller nay, tranh tao mapping trung duong dan.
 */
@Controller
public class UiPageController {

    private String page(Model model, String view, String active, String title) {
        model.addAttribute("activePage", active);
        model.addAttribute("pageTitle", title);
        return view;
    }

    @GetMapping("/")
    public String home(Model model) { return page(model, "index", "home", "Trang chủ"); }

    @GetMapping("/listening")
    public String listening(Model model) { return page(model, "listening/index", "listening", "Luyện Listening"); }

    @GetMapping("/exams")
    public String exams(Model model) { return page(model, "exams/index", "exams", "Thi thử TOEIC"); }

    @GetMapping("/exams/sample")
    public String sampleExam(Model model) { return page(model, "exams/sample", "exams", "Đề thi mẫu"); }



    @GetMapping("/login")
    public String login(Model model) { return page(model, "auth/login", "login", "Đăng nhập"); }

    @GetMapping("/register")
    public String register(Model model) { return page(model, "auth/register", "register", "Đăng ký"); }

    @GetMapping("/profile")
    public String profile(Model model) { return page(model, "account/profile", "profile", "Hồ sơ cá nhân"); }

}
