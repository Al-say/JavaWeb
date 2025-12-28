package com.zpz.schedule.test;

import com.zpz.schedule.util.JDBCUtil;
import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        System.out.println("正在尝试连接数据库...");
        try (Connection conn = JDBCUtil.getConnection()) {
            if (conn != null) {
                System.out.println("恭喜！数据库连接成功！");
                System.out.println("连接信息: " + conn.getMetaData().getURL());
            }
        } catch (Exception e) {
            System.err.println("数据库连接失败！");
            System.err.println("错误原因: " + e.getMessage());
            System.err.println("\n请检查以下几点:");
            System.err.println("1. MySQL 服务是否已启动？");
            System.err.println("2. 是否创建了名为 'schedule_db' 的数据库？");
            System.err.println("3. src/main/resources/jdbc.properties 中的用户名和密码是否正确？");
        }
    }
}
