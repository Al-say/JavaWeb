package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * JavaWeb应用程序主启动类
 * 继承SpringBootServletInitializer以支持传统的WAR部署
 */
@SpringBootApplication
public class JavaWebApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(JavaWebApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(JavaWebApplication.class);
    }
}
