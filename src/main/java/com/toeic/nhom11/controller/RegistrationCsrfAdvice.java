package com.toeic.nhom11.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.SecureRandom;
import java.util.Base64;

/** Tao token CSRF mot lan cho form dang ky; khong tao token moi khi POST. */
@ControllerAdvice
public class RegistrationCsrfAdvice {
    public static final String SESSION_KEY = "N11_REGISTER_CSRF";
    private static final SecureRandom RANDOM = new SecureRandom();

    @ModelAttribute("registerCsrfToken")
    public String registerCsrfToken(HttpServletRequest request) {
        if (!request.getRequestURI().endsWith("/register")) return "";
        boolean isGet = "GET".equalsIgnoreCase(request.getMethod());
        HttpSession session = request.getSession(isGet);
        if (session == null) return "";
        String token = (String) session.getAttribute(SESSION_KEY);
        if (token == null && isGet) {
            byte[] bytes = new byte[32];
            RANDOM.nextBytes(bytes);
            token = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
            session.setAttribute(SESSION_KEY, token);
        }
        return token == null ? "" : token;
    }
}
