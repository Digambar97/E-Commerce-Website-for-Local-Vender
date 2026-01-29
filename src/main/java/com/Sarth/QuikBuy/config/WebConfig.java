package com.Sarth.QuikBuy.config;

import com.Sarth.QuikBuy.interceptor.SessionInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private SessionInterceptor sessionInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(sessionInterceptor)
                .addPathPatterns("/api/**")       // Protect all data endpoints
                .addPathPatterns("/products")     // Protect the products page
                .addPathPatterns("/dashboard")    // Protect the dashboard
                .excludePathPatterns("/auth/**")  // Allow login/logout calls
                .excludePathPatterns("/login")    // Allow access to login page
                .excludePathPatterns("/css/**", "/js/**"); // Allow static assets
    }
}