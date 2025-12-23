package com.hsy.schedule.service;

import com.hsy.schedule.pojo.SysUser;

public interface SysUserService {
    boolean register(SysUser sysUser);
    SysUser login(String username, String password);
}
