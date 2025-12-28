package com.zpz.schedule.dao.impl;

import com.zpz.schedule.dao.BaseDao;
import com.zpz.schedule.dao.SysScheduleDao;
import com.zpz.schedule.pojo.SysSchedule;
import java.util.List;

public class SysScheduleDaoImpl extends BaseDao implements SysScheduleDao {
    @Override
    public int addSchedule(SysSchedule schedule) {
        String sql = "INSERT INTO sys_schedule(uid, title, completed) VALUES (?, ?, ?)";
        return baseUpdate(sql, schedule.getUid(), schedule.getTitle(), schedule.getCompleted());
    }

    @Override
    public List<SysSchedule> findByUid(Integer uid) {
        String sql = "SELECT sid, uid, title, completed FROM sys_schedule WHERE uid = ?";
        return baseQueryList(SysSchedule.class, sql, uid);
    }

    @Override
    public int updateSchedule(SysSchedule schedule) {
        String sql = "UPDATE sys_schedule SET title = ?, completed = ? WHERE sid = ?";
        return baseUpdate(sql, schedule.getTitle(), schedule.getCompleted(), schedule.getSid());
    }

    @Override
    public int deleteSchedule(Integer sid) {
        String sql = "DELETE FROM sys_schedule WHERE sid = ?";
        return baseUpdate(sql, sid);
    }
}
