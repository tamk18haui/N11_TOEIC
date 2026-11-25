package com.toeic.nhom11.controller;

import com.toeic.nhom11.service.StudyTrackingService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/** Dashboard Admin: chỉ đọc thống kê thật, không ghi hoặc thay đổi dữ liệu. */
@Controller
public class AdminDashboardController {
    private final JdbcTemplate db;
    private final StudyTrackingService tracking;

    public AdminDashboardController(JdbcTemplate db, StudyTrackingService tracking) {
        this.db = db;
        this.tracking = tracking;
    }

    @GetMapping("/admin")
    public String dashboard(Model model) {
        // Đếm toàn bộ học viên và học liệu, phân biệt đã công bố với bản nháp.
        model.addAttribute("dashboard", db.queryForMap("""
            SELECT (SELECT COUNT(*) FROM users WHERE role='STUDENT') students,
                   (SELECT COUNT(*) FROM users WHERE role='STUDENT' AND status='ACTIVE') active_students,
                   (SELECT COUNT(*) FROM users WHERE role='STUDENT' AND status='LOCKED') locked_students,
                   (SELECT COUNT(*) FROM grammar_lessons) grammar_lessons,
                   (SELECT COUNT(*) FROM grammar_lessons WHERE is_published=1) published_grammar,
                   (SELECT COUNT(*) FROM exam_papers) exam_papers,
                   (SELECT COUNT(*) FROM exam_papers WHERE is_published=1) published_exams
            """));
        // Dùng lại đúng quy tắc đếm lượt đã nộp của phân hệ thống kê V32.
        model.addAttribute("dashboardAttempts", tracking.totals(null, 0).get("attempts"));
        model.addAttribute("activePage", "admin");
        model.addAttribute("pageTitle", "Dashboard quản trị");
        return "admin/index";
    }
}
