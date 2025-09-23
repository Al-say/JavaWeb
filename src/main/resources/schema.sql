-- 创建数据库
CREATE DATABASE IF NOT EXISTS javaweb_demo 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE javaweb_demo;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_created_at (created_at)
);

-- 插入示例数据
INSERT INTO users (username, password, email, full_name) VALUES
('admin', '123456', 'admin@example.com', '系统管理员'),
('user1', '123456', 'user1@example.com', '张三'),
('user2', '123456', 'user2@example.com', '李四')
ON DUPLICATE KEY UPDATE username = username;
