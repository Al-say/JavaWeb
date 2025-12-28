package com.zpz.schedule.controller;

import com.zpz.schedule.pojo.SysSchedule;
import com.zpz.schedule.pojo.SysUser;
import com.zpz.schedule.service.SysScheduleService;
import com.zpz.schedule.service.impl.SysScheduleServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/schedule/*")
public class SysScheduleController extends BaseController {
    private SysScheduleService sysScheduleService = new SysScheduleServiceImpl();

    public void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        SysUser loginUser = (SysUser) session.getAttribute("loginUser");
        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login.html");
            return;
        }

        String title = req.getParameter("title");

        SysSchedule schedule = new SysSchedule();
        schedule.setUid(loginUser.getUid());
        schedule.setTitle(title);
        schedule.setCompleted(0);

        boolean result = sysScheduleService.addSchedule(schedule);

        if (result) {
            resp.sendRedirect(req.getContextPath() + "/showSchedule.html");
        } else {
            resp.getWriter().write("新增日程失败");
        }
    }

    public void list(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        SysUser loginUser = (SysUser) session.getAttribute("loginUser");
        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login.html");
            return;
        }

        List<SysSchedule> scheduleList = sysScheduleService.findByUid(loginUser.getUid());

        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < scheduleList.size(); i++) {
            SysSchedule s = scheduleList.get(i);
            json.append("{\"sid\":").append(s.getSid())
                    .append(",\"title\":\"").append(s.getTitle()).append("\"")
                    .append(",\"completed\":").append(s.getCompleted()).append("}");
            if (i < scheduleList.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write(json.toString());
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String sidStr = req.getParameter("sid");
        String completedStr = req.getParameter("completed");
        if (sidStr == null || completedStr == null) {
            resp.getWriter().write("参数错误");
            return;
        }

        SysSchedule schedule = new SysSchedule();
        schedule.setSid(Integer.parseInt(sidStr));
        schedule.setCompleted(Integer.parseInt(completedStr));

        boolean result = sysScheduleService.updateSchedule(schedule);
        resp.getWriter().write(result ? "success" : "fail");
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String sidStr = req.getParameter("sid");
        if (sidStr == null) {
            resp.getWriter().write("参数错误");
            return;
        }

        boolean result = sysScheduleService.deleteSchedule(Integer.parseInt(sidStr));
        resp.getWriter().write(result ? "success" : "fail");
    }
}
