package com.hsy.schedule.dao;

import com.hsy.schedule.pojo.SysUser;

public interface SysUserDao {
    int addSysUser(SysUser sysUser);
    SysUser findByUsername(String username);
}
