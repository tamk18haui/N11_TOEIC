package com.toeic.nhom11.service.impl;

import com.toeic.nhom11.dao.RegistrationDao;
import com.toeic.nhom11.model.RegistrationForm;
import com.toeic.nhom11.service.EmailAlreadyUsedException;
import com.toeic.nhom11.service.RegistrationService;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.Locale;

@Service
@Profile("!ui")
public class RegistrationServiceImpl implements RegistrationService {
    private final RegistrationDao dao;
    private final PasswordEncoder passwordEncoder;

    public RegistrationServiceImpl(RegistrationDao dao, PasswordEncoder passwordEncoder) {
        this.dao = dao;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public long register(RegistrationForm form) {
        String email = form.getEmail().trim().toLowerCase(Locale.ROOT);
        String fullName = form.getFullName().trim().replaceAll("\\s+", " ");
        if (!form.getPassword().equals(form.getConfirmPassword())) {
            throw new IllegalArgumentException("Mật khẩu xác nhận không khớp.");
        }
        // BCrypt chi xu ly toi da 72 byte; tranh mat ky tu im lang.
        if (form.getPassword().getBytes(StandardCharsets.UTF_8).length > 72) {
            throw new IllegalArgumentException("Mật khẩu vượt quá giới hạn 72 byte của BCrypt.");
        }
        if (dao.emailExists(email)) {
            throw new EmailAlreadyUsedException("Email này đã được đăng ký.");
        }
        return dao.createStudent(email, passwordEncoder.encode(form.getPassword()), fullName);
    }
}
