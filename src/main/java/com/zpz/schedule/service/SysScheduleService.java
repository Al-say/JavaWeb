package com.zpz.schedule.service;

import com.zpz.schedule.pojo.SysSchedule;
import java.util.List;

public interface SysScheduleService {
    boolean addSchedule(SysSchedule schedule);
    List<SysSchedule> findByUid(Integer uid);
    boolean updateSchedule(SysSchedule schedule);
    boolean deleteSchedule(Integer sid);
}
