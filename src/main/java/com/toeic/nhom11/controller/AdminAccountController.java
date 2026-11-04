package com.toeic.nhom11.controller;

import com.toeic.nhom11.config.AdminAccessInterceptor;
import com.toeic.nhom11.model.AccountForm;
import com.toeic.nhom11.service.AccountException;
import com.toeic.nhom11.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Các form POST thực thi nghiệp vụ; tất cả /admin/** được AdminAccessInterceptor kiểm soát. */
@Controller
@Profile("!ui")
@RequestMapping("/admin/accounts")
public class AdminAccountController {
    private final AccountService accounts;

    public AdminAccountController(AccountService accounts) { this.accounts = accounts; }

    @GetMapping
    public String list(@RequestParam(defaultValue = "") String q,
                       @RequestParam(defaultValue = "") String role,
                       @RequestParam(defaultValue = "") String status,
                       @RequestParam(defaultValue = "1") int page, Model model) {
        common(model);
        String query = q.trim().length() > 100 ? q.trim().substring(0, 100) : q.trim();
        String selectedRole = validFilter(role, "STUDENT", "ADMIN");
        String selectedStatus = validFilter(status, "ACTIVE", "LOCKED");
        model.addAttribute("accountPage", accounts.search(query, selectedRole, selectedStatus, page));
        model.addAttribute("q", query);
        model.addAttribute("roleFilter", selectedRole);
        model.addAttribute("statusFilter", selectedStatus);
        model.addAttribute("countAll", accounts.count("", ""));
        model.addAttribute("countStudent", accounts.count("STUDENT", ""));
        model.addAttribute("countAdmin", accounts.count("ADMIN", ""));
        model.addAttribute("countLocked", accounts.count("", "LOCKED"));
        return "admin/accounts";
    }

    @GetMapping("/new")
    public String add(Model model) {
        common(model);
        model.addAttribute("formMode", "new");
        model.addAttribute("accountForm", new AccountForm());
        return "admin/account-form";
    }

    @PostMapping
    public String create(@ModelAttribute AccountForm accountForm, Model model, RedirectAttributes redirect) {
        try {
            accounts.create(accountForm);
            redirect.addFlashAttribute("successMessage", "Đã tạo tài khoản thành công.");
            return "redirect:/admin/accounts";
        } catch (AccountException ex) {
            common(model);
            model.addAttribute("formMode", "new");
            model.addAttribute("accountForm", accountForm);
            model.addAttribute("formError", ex.getMessage());
            return "admin/account-form";
        }
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable long id, Model model, RedirectAttributes redirect) {
        try {
            common(model);
            model.addAttribute("formMode", "edit");
            model.addAttribute("accountId", id);
            model.addAttribute("accountForm", accounts.form(id));
            return "admin/account-form";
        } catch (AccountException ex) {
            redirect.addFlashAttribute("errorMessage", ex.getMessage());
            return "redirect:/admin/accounts";
        }
    }

    @PostMapping("/{id}")
    public String save(@PathVariable long id, @ModelAttribute AccountForm accountForm,
                       HttpSession session, Model model, RedirectAttributes redirect) {
        try {
            accounts.update(id, accountForm, (Long) session.getAttribute(AdminAccessInterceptor.SESSION_USER_ID));
            redirect.addFlashAttribute("successMessage", "Đã cập nhật tài khoản.");
            return "redirect:/admin/accounts";
        } catch (AccountException ex) {
            common(model);
            model.addAttribute("formMode", "edit");
            model.addAttribute("accountId", id);
            model.addAttribute("accountForm", accountForm);
            model.addAttribute("formError", ex.getMessage());
            return "admin/account-form";
        }
    }

    @PostMapping("/{id}/status")
    public String status(@PathVariable long id, @RequestParam String status,
                         HttpSession session, RedirectAttributes redirect) {
        try {
            accounts.changeStatus(id, status,
                    (Long) session.getAttribute(AdminAccessInterceptor.SESSION_USER_ID));
            redirect.addFlashAttribute("successMessage", "Đã cập nhật trạng thái tài khoản.");
        } catch (AccountException ex) {
            redirect.addFlashAttribute("errorMessage", ex.getMessage());
        }
        return "redirect:/admin/accounts";
    }

    private void common(Model model) {
        model.addAttribute("activePage", "admin-accounts");
        model.addAttribute("pageTitle", "Quản lý tài khoản");
    }

    private String validFilter(String value, String a, String b) {
        return a.equals(value) || b.equals(value) ? value : "";
    }
}
