package com.toeic.nhom11.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Profile("!ui")
public class AdminWebConfig implements WebMvcConfigurer {
    private final AdminAccessInterceptor adminAccess;

    public AdminWebConfig(AdminAccessInterceptor adminAccess) { this.adminAccess = adminAccess; }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminAccess).addPathPatterns("/admin", "/admin/**");
    }
}
