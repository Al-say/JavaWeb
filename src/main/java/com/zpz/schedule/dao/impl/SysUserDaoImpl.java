package com.zpz.schedule.dao.impl;

import com.zpz.schedule.dao.BaseDao;
import com.zpz.schedule.dao.SysUserDao;
import com.zpz.schedule.pojo.SysUser;

public class SysUserDaoImpl extends BaseDao implements SysUserDao {
    @Override
    public int addSysUser(SysUser sysUser) {
        String sql = "INSERT INTO sys_user(username, user_pwd) VALUES (?, ?)";
        return baseUpdate(sql, sysUser.getUsername(), sysUser.getUserPwd());
    }

    @Override
    public SysUser findByUsername(String username) {
        String sql = "SELECT uid, username, user_pwd as userPwd FROM sys_user WHERE username = ?";
        return baseQueryOne(SysUser.class, sql, username);
    }
}
