package com.toeic.nhom11.config;

import com.toeic.nhom11.dao.AccountDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

/** Bảo vệ mọi /admin/**, không phụ thuộc kiểm tra vai trò ở phía giao diện. */
@Component
@Profile("!ui")
public class AdminAccessInterceptor implements HandlerInterceptor {
    public static final String SESSION_USER_ID = "N11_AUTH_USER_ID";
    private static final String CSRF_SESSION_KEY = "N11_ADMIN_CSRF";
    private static final SecureRandom RANDOM = new SecureRandom();
    private final AccountDao dao;

    public AdminAccessInterceptor(AccountDao dao) { this.dao = dao; }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        boolean safeMethod = "GET".equalsIgnoreCase(request.getMethod())
                || "HEAD".equalsIgnoreCase(request.getMethod());
        HttpSession session = request.getSession(safeMethod);
        if (session == null) { response.sendError(403); return false; }

        // Mọi POST quản trị, kể cả đăng xuất, đều cần token CSRF.
        if (!safeMethod) {
            String expected = (String) session.getAttribute(CSRF_SESSION_KEY);
            String actual = request.getParameter("_adminCsrf");
            if (expected == null || actual == null || !MessageDigest.isEqual(
                    expected.getBytes(StandardCharsets.UTF_8), actual.getBytes(StandardCharsets.UTF_8))) {
                response.sendError(403, "Mã xác nhận không hợp lệ. Hãy tải lại trang.");
                return false;
            }
        }

        if (safeMethod && session.getAttribute(CSRF_SESSION_KEY) == null) {
            byte[] bytes = new byte[32];
            RANDOM.nextBytes(bytes);
            session.setAttribute(CSRF_SESSION_KEY, Base64.getUrlEncoder().withoutPadding().encodeToString(bytes));
        }
        request.setAttribute("adminCsrfToken", session.getAttribute(CSRF_SESSION_KEY));

        Object id = session.getAttribute(SESSION_USER_ID);
        if (!(id instanceof Long userId) || !dao.activeAdmin(userId)) {
            if (safeMethod) response.sendRedirect(request.getContextPath() + "/login");
            else response.sendError(403, "Bạn cần đăng nhập bằng tài khoản Admin.");
            return false;
        }
        return true;
    }
}
