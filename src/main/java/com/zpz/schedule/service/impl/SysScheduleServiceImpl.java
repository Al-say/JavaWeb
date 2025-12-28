package com.zpz.schedule.service.impl;

import com.zpz.schedule.dao.SysScheduleDao;
import com.zpz.schedule.dao.impl.SysScheduleDaoImpl;
import com.zpz.schedule.pojo.SysSchedule;
import com.zpz.schedule.service.SysScheduleService;
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
