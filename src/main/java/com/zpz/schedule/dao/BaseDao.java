package com.zpz.schedule.dao;

import com.zpz.schedule.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class BaseDao {
    protected QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDataSource());

    public int baseUpdate(String sql, Object... params) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.update(conn, sql, params);
        } catch (SQLException e) {
            throw new RuntimeException("增删改操作失败", e);
        } finally {
            JDBCUtil.close(conn);
        }
    }

    public <T> T baseQueryOne(Class<T> clazz, String sql, Object... params) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanHandler<>(clazz), params);
        } catch (SQLException e) {
            throw new RuntimeException("查询单个对象失败", e);
        } finally {
            JDBCUtil.close(conn);
        }
    }

    public <T> List<T> baseQueryList(Class<T> clazz, String sql, Object... params) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanListHandler<>(clazz), params);
        } catch (SQLException e) {
            throw new RuntimeException("查询列表失败", e);
        } finally {
            JDBCUtil.close(conn);
        }
    }

    public <T> T baseQueryScalar(String sql, Object... params) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new ScalarHandler<>(), params);
        } catch (SQLException e) {
            throw new RuntimeException("查询单个值失败", e);
        } finally {
            JDBCUtil.close(conn);
        }
    }
}
