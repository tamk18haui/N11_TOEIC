package com.toeic.nhom11.controller;

import com.toeic.nhom11.config.AdminAccessInterceptor;
import com.toeic.nhom11.service.AccountService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * POST /login dùng đúng trang auth/login.jsp sẵn có của nhóm.
 * GET /login vẫn do UiPageController xử lý, không tạo trang đăng nhập thứ hai.
 * Khi Minh Quân hoàn thiện phần đăng nhập, chỉ cần thống nhất session key.
 */
@Controller
@Profile("!ui")
public class LoginController {
    private final AccountService accounts;

    public LoginController(AccountService accounts) { this.accounts = accounts; }

    @PostMapping("/login")
    public String login(@RequestParam(defaultValue = "") String email,
                        @RequestParam(defaultValue = "") String password,
                        @RequestParam(value = "_loginCsrf", required = false) String token,
                        HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String expected = session == null ? null : (String) session.getAttribute(LoginCsrfAdvice.SESSION_KEY);
        if (expected == null || token == null ||
                !MessageDigest.isEqual(expected.getBytes(StandardCharsets.UTF_8),
                        token.getBytes(StandardCharsets.UTF_8))) {
            return loginError(model, "Phiên đăng nhập không hợp lệ, hãy tải lại trang.");
        }

        AccountService.LoginIdentity identity = accounts.authenticate(email, password);
        if (identity == null) {
            return loginError(model, "Email hoặc mật khẩu không đúng, hoặc tài khoản đã bị khóa.");
        }

        request.changeSessionId(); // Chống session fixation.
        session.setAttribute(AdminAccessInterceptor.SESSION_USER_ID, identity.id());
        session.removeAttribute(LoginCsrfAdvice.SESSION_KEY); // Token chỉ dùng một lần.
        return "ADMIN".equals(identity.role()) ? "redirect:/admin/accounts" : "redirect:/";
    }

    @PostMapping("/admin/logout")
    public String logoutAdmin(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    private String loginError(Model model, String message) {
        model.addAttribute("pageTitle", "Đăng nhập");
        model.addAttribute("activePage", "login");
        model.addAttribute("loginError", message);
        return "auth/login";
    }
}
