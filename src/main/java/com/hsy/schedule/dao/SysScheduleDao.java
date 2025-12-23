package com.hsy.schedule.dao;

import com.hsy.schedule.pojo.SysSchedule;
import java.util.List;

public interface SysScheduleDao {
    int addSchedule(SysSchedule schedule);
    List<SysSchedule> findByUid(Integer uid);
    int updateSchedule(SysSchedule schedule);
    int deleteSchedule(Integer sid);
}
