package com.toeic.nhom11.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.SecureRandom;
import java.util.Base64;

/** Tạo token CSRF cho form đăng nhập chung; không tạo mới trên POST. */
@ControllerAdvice
public class LoginCsrfAdvice {
    static final String SESSION_KEY = "N11_LOGIN_CSRF";
    private static final SecureRandom RANDOM = new SecureRandom();

    @ModelAttribute("loginCsrfToken")
    public String token(HttpServletRequest request) {
        if (!request.getRequestURI().endsWith("/login")) return "";
        boolean get = "GET".equalsIgnoreCase(request.getMethod());
        HttpSession session = request.getSession(get);
        if (session == null) return "";

        String value = (String) session.getAttribute(SESSION_KEY);
        if (value == null && get) {
            byte[] bytes = new byte[32];
            RANDOM.nextBytes(bytes);
            value = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
            session.setAttribute(SESSION_KEY, value);
        }
        return value == null ? "" : value;
    }
}
