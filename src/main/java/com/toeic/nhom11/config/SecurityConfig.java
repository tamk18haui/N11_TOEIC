package com.toeic.nhom11.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {


    @Bean UserDetailsService userDetailsService(JdbcTemplate jdbc) {
        return email -> jdbc.query("SELECT email,password_hash,role,status FROM users WHERE email=?",
            (rs, row) -> User.withUsername(rs.getString("email"))
                .password(rs.getString("password_hash")).roles(rs.getString("role"))
                .disabled(!"ACTIVE".equals(rs.getString("status"))).build(), email.trim().toLowerCase(java.util.Locale.ROOT))
            .stream().findFirst().orElseThrow(() -> new UsernameNotFoundException("Không tìm thấy tài khoản"));
    }

    @Bean SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http.authorizeHttpRequests(auth -> auth
            .requestMatchers("/admin/**").hasRole("ADMIN")
            .requestMatchers("/grammar/*/submit", "/grammar/*/practice/check", "/grammar/attempts/**", "/grammar/history", "/profile").authenticated()
            .anyRequest().permitAll())
            .formLogin(login -> login.loginPage("/login").usernameParameter("email")
                .defaultSuccessUrl("/grammar", false).failureUrl("/login?error").permitAll())
            .logout(logout -> logout.logoutSuccessUrl("/grammar"))
            .build();
    }
}
