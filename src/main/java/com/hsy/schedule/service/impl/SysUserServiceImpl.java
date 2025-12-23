package com.hsy.schedule.service.impl;

import com.hsy.schedule.dao.SysUserDao;
import com.hsy.schedule.dao.impl.SysUserDaoImpl;
import com.hsy.schedule.pojo.SysUser;
import com.hsy.schedule.service.SysUserService;
import com.hsy.schedule.util.MD5Util;

public class SysUserServiceImpl implements SysUserService {
    private SysUserDao sysUserDao = new SysUserDaoImpl();

    @Override
    public boolean register(SysUser sysUser) {
        SysUser existUser = sysUserDao.findByUsername(sysUser.getUsername());
        if (existUser != null) {
            return false;
        }
        sysUser.setUserPwd(MD5Util.encrypt(sysUser.getUserPwd()));
        return sysUserDao.addSysUser(sysUser) > 0;
    }

    @Override
    public SysUser login(String username, String password) {
        SysUser sysUser = sysUserDao.findByUsername(username);
        if (sysUser == null) {
            return null;
        }
        if (sysUser.getUserPwd().equals(MD5Util.encrypt(password))) {
            return sysUser;
        }
        return null;
    }
}
