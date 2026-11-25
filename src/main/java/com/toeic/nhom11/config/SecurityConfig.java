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
            
            // N11_V45_GUEST_ACCESS: public catalog GET only; learning and account data require login.
            .requestMatchers("/vocabulary/history", "/vocabulary/preferences", "/vocabulary/attempts/**").authenticated()
            .requestMatchers(org.springframework.http.HttpMethod.GET,
                "/grammar", "/grammar/", "/vocabulary", "/vocabulary/", "/vocabulary/*",
                "/listening", "/listening/", "/listening/api/overview",
                "/reading", "/reading/", "/reading/part5", "/reading/part6", "/reading/part7",
                "/exams", "/exams/").permitAll()
            .requestMatchers("/grammar/**", "/vocabulary/**", "/listening/**", "/reading/**",
                "/exams/**", "/speaking/**", "/roadmap/**", "/progress/**", "/profile").authenticated()
            .anyRequest().permitAll())
            .requestCache(cache -> cache.requestCache(requestCache))
            .formLogin(login -> login.loginPage("/login").usernameParameter("email")
                .successHandler((request, response, authentication) -> {
                    boolean admin = authentication.getAuthorities().stream()
                            .anyMatch(authority -> "ROLE_ADMIN".equals(authority.getAuthority()));
                    String destination = admin ? "/admin/accounts" : "/";
                    if (!admin && requestCache.getRequest(request, response) instanceof DefaultSavedRequest saved
                            && "GET".equals(saved.getMethod())) {
                        String path = saved.getRequestURI();
                        String context = request.getContextPath();
                        if (path.startsWith(context)) {
                            String relative = path.substring(context.length());
                            if (relative.matches("/grammar/[0-9]+/?")
                                    || relative.matches("/vocabulary/[0-9]+/(?:lessons/[0-9]+(?:/quiz/(?:exercise|dictation))?|placement)/?")
                                    || relative.matches("/listening/practice/[0-9]+/?")
                                    || relative.matches("/reading(?:/part[5-7](?:/[1-5](?:/ready)?)?)?")
                                    || relative.matches("/exams(?:/[0-9]+/ready|/attempts/[0-9]+(?:/result)?|/history)?/?")) {
                                destination = relative;
                                String query = saved.getQueryString();
                                if (query != null && !query.isBlank() && query.indexOf('\r') < 0 && query.indexOf('\n') < 0) {
                                    destination += "?" + query;
                                }
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
