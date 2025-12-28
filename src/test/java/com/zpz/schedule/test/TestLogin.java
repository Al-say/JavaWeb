package com.zpz.schedule.test;

import com.zpz.schedule.pojo.SysUser;
import com.zpz.schedule.service.SysUserService;
import com.zpz.schedule.service.impl.SysUserServiceImpl;

public class TestLogin {
    public static void main(String[] args) {
        SysUserService userService = new SysUserServiceImpl();

        // 1. 测试注册 (假设数据库还没有 zhangsan)
        SysUser newUser = new SysUser(null, "zhangsan", "123456");
        boolean regResult = userService.register(newUser);
        System.out.println("注册结果: " + (regResult ? "成功" : "失败 (可能用户已存在)"));

        // 2. 测试登录 (正确密码)
        SysUser loginUser = userService.login("zhangsan", "123456");
        if (loginUser != null) {
            System.out.println("登录成功! 用户信息: " + loginUser);
        } else {
            System.out.println("登录失败! 用户名或密码错误");
        }

        // 3. 测试登录 (错误密码)
        SysUser loginUserError = userService.login("zhangsan", "wrong_pwd");
        System.out.println("错误密码登录测试: " + (loginUserError == null ? "通过 (登录被拒绝)" : "失败 (错误密码竟然登录了)"));
    }
}
