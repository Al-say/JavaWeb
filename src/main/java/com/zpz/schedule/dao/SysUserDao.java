package com.zpz.schedule.dao;

import com.zpz.schedule.pojo.SysUser;

public interface SysUserDao {
    int addSysUser(SysUser sysUser);
    SysUser findByUsername(String username);
}
