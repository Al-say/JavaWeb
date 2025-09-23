<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加用户 - JavaWeb应用程序</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
                        <a class="nav-link" href="/about">关于</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0">
                            <i class="fas fa-user-plus me-2"></i>添加新用户
                        </h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>${error}
                            </div>
                        </c:if>

                        <form method="post" action="/users" novalidate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="username" class="form-label">
                                        <i class="fas fa-user me-1"></i>用户名 <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control ${not empty errors && errors.hasFieldErrors('username') ? 'is-invalid' : ''}" 
                                           id="username" name="username" value="${user.username}" required>
                                    <c:if test="${not empty errors && errors.hasFieldErrors('username')}">
                                        <div class="invalid-feedback">
                                            ${errors.getFieldError('username').defaultMessage}
                                        </div>
                                    </c:if>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">
                                        <i class="fas fa-envelope me-1"></i>邮箱 <span class="text-danger">*</span>
                                    </label>
                                    <input type="email" class="form-control ${not empty errors && errors.hasFieldErrors('email') ? 'is-invalid' : ''}" 
                                           id="email" name="email" value="${user.email}" required>
                                    <c:if test="${not empty errors && errors.hasFieldErrors('email')}">
                                        <div class="invalid-feedback">
                                            ${errors.getFieldError('email').defaultMessage}
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="password" class="form-label">
                                        <i class="fas fa-lock me-1"></i>密码 <span class="text-danger">*</span>
                                    </label>
                                    <input type="password" class="form-control ${not empty errors && errors.hasFieldErrors('password') ? 'is-invalid' : ''}" 
                                           id="password" name="password" required>
                                    <c:if test="${not empty errors && errors.hasFieldErrors('password')}">
                                        <div class="invalid-feedback">
                                            ${errors.getFieldError('password').defaultMessage}
                                        </div>
                                    </c:if>
                                    <div class="form-text">密码长度至少6个字符</div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="fullName" class="form-label">
                                        <i class="fas fa-id-card me-1"></i>全名
                                    </label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}">
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                        <a href="/users" class="btn btn-secondary me-md-2">
                                            <i class="fas fa-times me-1"></i>取消
                                        </a>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-1"></i>保存用户
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 帮助信息 -->
                <div class="card mt-3">
                    <div class="card-body">
                        <h6 class="card-title"><i class="fas fa-info-circle me-1"></i>填写说明</h6>
                        <ul class="list-unstyled mb-0">
                            <li><small class="text-muted"><i class="fas fa-check me-1"></i>用户名必须是3-50个字符的唯一标识</small></li>
                            <li><small class="text-muted"><i class="fas fa-check me-1"></i>邮箱地址必须格式正确且唯一</small></li>
                            <li><small class="text-muted"><i class="fas fa-check me-1"></i>密码长度至少6个字符</small></li>
                            <li><small class="text-muted"><i class="fas fa-check me-1"></i>全名为可选字段</small></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 表单验证
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
