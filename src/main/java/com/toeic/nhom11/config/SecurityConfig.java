package com.toeic.nhom11.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

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
        var requestCache = new HttpSessionRequestCache();
        return http.authorizeHttpRequests(auth -> auth
            .requestMatchers("/", "/login", "/register", "/forgot-password", "/reset-password",
                "/assets/**", "/css/**", "/js/**",
                "/images/**", "/webjars/**", "/favicon.ico").permitAll()
            .requestMatchers("/admin", "/admin/**").hasRole("ADMIN")
            .requestMatchers("/vocabulary/preferences", "/vocabulary/*/placement/**",
                "/vocabulary/*/lessons/*/quiz/**").authenticated()
            .requestMatchers("/vocabulary/flashcard/*/bookmark").authenticated()
            .requestMatchers("/vocabulary", "/vocabulary/*", "/vocabulary/flashcard/next").permitAll()
            .requestMatchers("/vocabulary/*/submit", "/vocabulary/*/progress", "/vocabulary/*/favorite",
                "/vocabulary/attempts/**", "/vocabulary/history").authenticated()
            .requestMatchers("/listening/**", "/reading/**", "/exams/**",
                "/roadmap/**", "/progress/**", "/profile", "/grammar/*/submit",
                "/grammar/*/practice/check", "/grammar/attempts/**", "/grammar/history").authenticated()
            .anyRequest().permitAll())
            .requestCache(cache -> cache.requestCache(requestCache))
            .formLogin(login -> login.loginPage("/login").usernameParameter("email")
                .successHandler((request, response, authentication) -> {
                    boolean admin = authentication.getAuthorities().stream()
                            .anyMatch(authority -> "ROLE_ADMIN".equals(authority.getAuthority()));
                    String destination = admin ? "/admin/accounts" : "/grammar";
                    if (!admin && requestCache.getRequest(request, response) instanceof DefaultSavedRequest saved
                            && "GET".equals(saved.getMethod())) {
                        String path = saved.getRequestURI();
                        String context = request.getContextPath();
                        if (path.startsWith(context)) {
                            String relative = path.substring(context.length());
                            if (relative.matches("/reading(?:/part[5-7](?:/[1-5](?:/ready)?)?)?")
                                    || relative.matches("/exams(?:/[0-9]+/ready|/attempts/[0-9]+(?:/result)?|/history)?/?")) {
                                destination = relative;
                                requestCache.removeRequest(request, response);
                            }
                        }
                    }
                    response.sendRedirect(request.getContextPath() + destination);
                }).failureUrl("/login?error").permitAll())
            .logout(logout -> logout.logoutSuccessUrl("/grammar"))
            .build();
    }
}
