package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 首页控制器
 */
@Controller
public class HomeController {

    /**
     * 首页
     */
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "欢迎使用JavaWeb应用程序！");
        model.addAttribute("currentTime", LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        return "index";
    }

    /**
     * API接口示例
     */
    @GetMapping("/api/hello")
    @ResponseBody
    public String hello() {
        return "{\"message\": \"Hello from JavaWeb API!\", \"timestamp\": \"" 
                + LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME) + "\"}";
    }

    /**
     * 关于页面
     */
    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("title", "关于我们");
        model.addAttribute("description", "这是一个基于Spring Boot的JavaWeb应用程序示例");
        return "about";
    }
}
