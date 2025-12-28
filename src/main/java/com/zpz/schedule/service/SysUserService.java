package com.zpz.schedule.service;

import com.zpz.schedule.pojo.SysUser;

public interface SysUserService {
    boolean register(SysUser sysUser);
    SysUser login(String username, String password);
}
