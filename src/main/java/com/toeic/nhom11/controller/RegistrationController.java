package com.toeic.nhom11.controller;

import com.toeic.nhom11.model.RegistrationForm;
import com.toeic.nhom11.service.EmailAlreadyUsedException;
import com.toeic.nhom11.service.RegistrationService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/** GET /register giu nguyen trong UiPageController; class nay chi xu ly POST that. */
@Controller
@Profile("!ui")
public class RegistrationController {
    private final RegistrationService service;

    public RegistrationController(RegistrationService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("registrationForm") RegistrationForm form,
                           BindingResult result,
                           @RequestParam(value = "_registrationCsrf", required = false) String postedToken,
                           HttpServletRequest request,
                           Model model,
                           RedirectAttributes redirect) {
        model.addAttribute("activePage", "register");
        model.addAttribute("pageTitle", "Đăng ký");

        HttpSession session = request.getSession(false);
        String expected = session == null ? null : (String) session.getAttribute(RegistrationCsrfAdvice.SESSION_KEY);
        if (expected == null || postedToken == null || !MessageDigest.isEqual(
                expected.getBytes(StandardCharsets.UTF_8), postedToken.getBytes(StandardCharsets.UTF_8))) {
            model.addAttribute("formError", "Phiên đăng ký hết hạn hoặc không hợp lệ. Hãy tải lại trang rồi thử lại.");
            return invalid(model, result);
        }
        if (!Objects.equals(form.getPassword(), form.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "mismatch", "Mật khẩu xác nhận không khớp.");
        }
        if (form.getPassword() != null && form.getPassword().getBytes(StandardCharsets.UTF_8).length > 72) {
            result.rejectValue("password", "tooLongBytes", "Mật khẩu vượt quá 72 byte, hãy chọn mật khẩu ngắn hơn.");
        }
        if (result.hasErrors()) return invalid(model, result);

        try {
            service.register(form);
        } catch (EmailAlreadyUsedException e) {
            result.rejectValue("email", "exists", e.getMessage());
            return invalid(model, result);
        } catch (IllegalArgumentException e) {
            model.addAttribute("formError", e.getMessage());
            return invalid(model, result);
        } catch (DataAccessException e) {
            // Khong lo mat khau hoac SQL cho nguoi dung.
            model.addAttribute("formError", "Không thể kết nối hoặc ghi dữ liệu MySQL. Vui lòng thử lại.");
            return invalid(model, result);
        }

        session.removeAttribute(RegistrationCsrfAdvice.SESSION_KEY);
        redirect.addFlashAttribute("registerSuccessEmail", form.getEmail().trim());
        return "redirect:/register"; // POST/Redirect/GET: refresh khong dang ky lap.
    }

    private String invalid(Model model, BindingResult result) {
        Map<String, String> errors = new HashMap<>();
        result.getFieldErrors().forEach(error -> errors.putIfAbsent(error.getField(), error.getDefaultMessage()));
        model.addAttribute("fieldErrors", errors);
        return "auth/register";
    }
}
