<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - JavaWeb应用程序</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <a class="nav-link" href="/">首页</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users">用户管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/about">关于</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="mb-0">${title}</h2>
                    </div>
                    <div class="card-body">
                        <p class="lead">${description}</p>
                        
                        <h4>技术栈</h4>
                        <ul class="list-group list-group-flush mb-4">
                            <li class="list-group-item"><strong>后端框架：</strong>Spring Boot 2.7.18</li>
                            <li class="list-group-item"><strong>数据访问：</strong>Spring Data JPA</li>
                            <li class="list-group-item"><strong>数据库：</strong>MySQL 8.0</li>
                            <li class="list-group-item"><strong>视图技术：</strong>JSP + JSTL</li>
                            <li class="list-group-item"><strong>前端框架：</strong>Bootstrap 5</li>
                            <li class="list-group-item"><strong>构建工具：</strong>Maven</li>
                            <li class="list-group-item"><strong>开发工具：</strong>Spring Boot DevTools</li>
                        </ul>

                        <h4>主要功能</h4>
                        <ul class="list-group list-group-flush mb-4">
                            <li class="list-group-item">用户管理系统（CRUD操作）</li>
                            <li class="list-group-item">RESTful API接口</li>
                            <li class="list-group-item">数据验证和错误处理</li>
                            <li class="list-group-item">响应式Web设计</li>
                            <li class="list-group-item">自动重启和热重载</li>
                        </ul>

                        <h4>项目结构</h4>
                        <pre class="bg-light p-3 rounded">
src/
├── main/
│   ├── java/
│   │   └── com/example/demo/
│   │       ├── controller/     # 控制器层
│   │       ├── model/          # 实体模型
│   │       ├── repository/     # 数据访问层
│   │       ├── service/        # 业务逻辑层
│   │       └── JavaWebApplication.java
│   ├── resources/
│   │   └── application.properties
│   └── webapp/
│       └── WEB-INF/
│           └── views/          # JSP视图文件
└── test/                       # 测试代码
                        </pre>

                        <div class="text-center mt-4">
                            <a href="/" class="btn btn-primary">返回首页</a>
                            <a href="/users" class="btn btn-success">用户管理</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
