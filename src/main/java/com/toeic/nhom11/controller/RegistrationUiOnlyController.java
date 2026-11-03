package com.toeic.nhom11.controller;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

/** Khi chay profile ui, giao dien co the mo nhung se KHONG ghi MySQL. */
@Controller
@Profile("ui")
public class RegistrationUiOnlyController {
    @PostMapping("/register")
    public String disabled(Model model) {
        model.addAttribute("activePage", "register");
        model.addAttribute("pageTitle", "Đăng ký");
        model.addAttribute("formError", "Bạn đang chạy profile 'ui' (chế độ mẫu, không có MySQL). Hãy chạy ứng dụng không dùng profile 'ui' để đăng ký thật.");
        return "auth/register";
    }
}
