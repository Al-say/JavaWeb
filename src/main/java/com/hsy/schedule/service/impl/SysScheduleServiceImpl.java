package com.hsy.schedule.service.impl;

import com.hsy.schedule.dao.SysScheduleDao;
import com.hsy.schedule.dao.impl.SysScheduleDaoImpl;
import com.hsy.schedule.pojo.SysSchedule;
import com.hsy.schedule.service.SysScheduleService;
import java.util.List;

public class SysScheduleServiceImpl implements SysScheduleService {
    private SysScheduleDao sysScheduleDao = new SysScheduleDaoImpl();

    @Override
    public boolean addSchedule(SysSchedule schedule) {
        return sysScheduleDao.addSchedule(schedule) > 0;
    }

    @Override
    public List<SysSchedule> findByUid(Integer uid) {
        return sysScheduleDao.findByUid(uid);
    }

    @Override
    public boolean updateSchedule(SysSchedule schedule) {
        return sysScheduleDao.updateSchedule(schedule) > 0;
    }

    @Override
    public boolean deleteSchedule(Integer sid) {
        return sysScheduleDao.deleteSchedule(sid) > 0;
    }
}
