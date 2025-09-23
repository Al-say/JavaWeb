<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaWeb应用程序</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 80px 0;
        }
        .feature-card {
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">JavaWeb Demo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/">首页</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users">用户管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">关于</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 mb-4">${message}</h1>
            <p class="lead mb-4">基于Spring Boot构建的现代JavaWeb应用程序</p>
            <p class="mb-4">当前时间：${currentTime}</p>
            <a href="/users" class="btn btn-light btn-lg me-3">用户管理</a>
            <a href="/api/hello" class="btn btn-outline-light btn-lg">API测试</a>
        </div>
    </div>

    <!-- 功能特性 -->
    <section class="py-5">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col">
                    <h2>主要功能特性</h2>
                    <p class="text-muted">这个JavaWeb应用程序包含以下核心功能</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-users fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title">用户管理</h5>
                            <p class="card-text">完整的用户CRUD操作，包括创建、读取、更新和删除用户信息。</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-database fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title">数据持久化</h5>
                            <p class="card-text">使用Spring Data JPA和MySQL数据库进行数据持久化。</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="fas fa-code fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title">RESTful API</h5>
                            <p class="card-text">提供RESTful API接口，支持JSON数据格式交互。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 页脚 -->
    <footer class="bg-dark text-light py-4 mt-5">
        <div class="container text-center">
            <p>&copy; 2024 JavaWeb Demo. 基于Spring Boot构建.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>
