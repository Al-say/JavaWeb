package com.hsy.schedule.controller;

import com.hsy.schedule.pojo.SysUser;
import com.hsy.schedule.service.SysUserService;
import com.hsy.schedule.service.impl.SysUserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/*")
public class SysUserController extends BaseController {
    private SysUserService sysUserService = new SysUserServiceImpl();

    public void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");

        if (username == null || password == null || !password.equals(repassword)) {
            resp.sendRedirect(req.getContextPath() + "/registError.html");
            return;
        }

        SysUser sysUser = new SysUser();
        sysUser.setUsername(username);
        sysUser.setUserPwd(password);
        boolean result = sysUserService.register(sysUser);

        if (result) {
            resp.sendRedirect(req.getContextPath() + "/registSuccess.html");
        } else {
            resp.sendRedirect(req.getContextPath() + "/registUsernameExist.html");
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        SysUser sysUser = sysUserService.login(username, password);

        if (sysUser != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loginUser", sysUser);
            resp.sendRedirect(req.getContextPath() + "/showSchedule.html");
        } else {
            resp.sendRedirect(req.getContextPath() + "/loginError.html");
        }
    }

    public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect(req.getContextPath() + "/login.html");
    }
}
