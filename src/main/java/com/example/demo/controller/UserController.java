package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 显示用户列表页面
     */
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users/list";
    }

    /**
     * 显示用户详情页面
     */
    @GetMapping("/{id}")
    public String showUser(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        model.addAttribute("user", user);
        return "users/detail";
    }

    /**
     * 显示创建用户表单
     */
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        return "users/form";
    }

    /**
     * 处理创建用户请求
     */
    @PostMapping
    public String createUser(@Valid @ModelAttribute User user, 
                           BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "users/form";
        }
        
        try {
            userService.createUser(user);
            return "redirect:/users";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "users/form";
        }
    }

    /**
     * 显示编辑用户表单
     */
    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        model.addAttribute("user", user);
        return "users/edit";
    }

    /**
     * 处理更新用户请求
     */
    @PostMapping("/{id}")
    public String updateUser(@PathVariable Long id, 
                           @Valid @ModelAttribute User user,
                           BindingResult result, Model model) {
        if (result.hasErrors()) {
            user.setId(id);
            return "users/edit";
        }
        
        try {
            userService.updateUser(id, user);
            return "redirect:/users";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            user.setId(id);
            return "users/edit";
        }
    }

    /**
     * 删除用户
     */
    @PostMapping("/{id}/delete")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

    // REST API接口
    
    /**
     * 获取所有用户的API接口
     */
    @GetMapping("/api")
    @ResponseBody
    public List<User> getAllUsersApi() {
        return userService.getAllUsers();
    }

    /**
     * 根据ID获取用户的API接口
     */
    @GetMapping("/api/{id}")
    @ResponseBody
    public ResponseEntity<User> getUserApi(@PathVariable Long id) {
        return userService.getUserById(id)
                .map(user -> ResponseEntity.ok().body(user))
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * 创建用户的API接口
     */
    @PostMapping("/api")
    @ResponseBody
    public ResponseEntity<User> createUserApi(@Valid @RequestBody User user) {
        try {
            User createdUser = userService.createUser(user);
            return ResponseEntity.ok(createdUser);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
