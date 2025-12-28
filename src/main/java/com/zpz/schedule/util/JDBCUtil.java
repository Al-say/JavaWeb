package com.zpz.schedule.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.sql.Statement;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    private static DataSource dataSource;

    static {
        try {
            Properties props = new Properties();
            InputStream is = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
            props.load(is);
            dataSource = DruidDataSourceFactory.createDataSource(props);

            // Ensure required tables exist when using the in-memory fallback (or empty DB).
            try (Connection conn = dataSource.getConnection(); Statement stmt = conn.createStatement()) {
                stmt.execute("CREATE TABLE IF NOT EXISTS sys_user (" +
                        "uid INT PRIMARY KEY AUTO_INCREMENT, " +
                        "username VARCHAR(50) NOT NULL UNIQUE, " +
                        "user_pwd VARCHAR(64) NOT NULL" +
                        ")");
                stmt.execute("CREATE TABLE IF NOT EXISTS sys_schedule (" +
                        "sid INT PRIMARY KEY AUTO_INCREMENT, " +
                        "uid INT NOT NULL, " +
                        "title VARCHAR(255), " +
                        "completed INT DEFAULT 0, " +
                        "CONSTRAINT fk_schedule_user FOREIGN KEY (uid) REFERENCES sys_user(uid) ON DELETE CASCADE" +
                        ")");
            } catch (Exception ddlEx) {
                ddlEx.printStackTrace();
                throw new RuntimeException("初始化数据库表失败", ddlEx);
            }
        } catch (Exception e) {
            throw new RuntimeException("初始化数据库连接池失败", e);
        }
    }

    public static Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("获取数据库连接失败", e);
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }

    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
