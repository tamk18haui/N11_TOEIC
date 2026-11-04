package com.toeic.nhom11.config;

import com.toeic.nhom11.dao.AccountDao;
import com.toeic.nhom11.model.AccountForm;
import com.toeic.nhom11.service.AccountService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/** Tạo Admin đầu tiên duy nhất bằng cấu hình .env, không dùng mật khẩu mẫu cố định. */
@Configuration
@Profile("!ui")
public class AdminBootstrap {
    @Bean
    ApplicationRunner firstAdmin(AccountDao dao, AccountService service,
            @Value("${N11_BOOTSTRAP_ADMIN_EMAIL:}") String email,
            @Value("${N11_BOOTSTRAP_ADMIN_PASSWORD:}") String password) {
        return args -> {
            if (email.isBlank() && password.isBlank()) return;
            if (email.isBlank() || password.isBlank()) {
                throw new IllegalStateException("Cần cấu hình cả email và mật khẩu Admin đầu tiên.");
            }
            // Không tự nâng quyền tài khoản STUDENT đã tồn tại; tránh lạm quyền từ biến môi trường.
            if (dao.count("ADMIN", "") > 0) return;
            if (dao.emailTaken(email.trim().toLowerCase(java.util.Locale.ROOT), null)) {
                throw new IllegalStateException("Email Admin đầu tiên đã được tài khoản khác sử dụng.");
            }
            AccountForm form = new AccountForm();
            form.setEmail(email);
            form.setFullName("Quản trị hệ thống");
            form.setPassword(password);
            form.setRole("ADMIN");
            service.create(form);
            System.out.println("N11 TOEIC: Đã tạo tài khoản Admin đầu tiên. Hãy xóa hai biến bootstrap khỏi .env.");
        };
    }
}
