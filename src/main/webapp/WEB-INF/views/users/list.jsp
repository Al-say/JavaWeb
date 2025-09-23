<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理 - JavaWeb应用程序</title>
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
                        <a class="nav-link active" href="/users">用户管理</a>
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
        <div class="row">
            <div class="col">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-users me-2"></i>用户管理</h2>
                    <a href="/users/new" class="btn btn-primary">
                        <i class="fas fa-plus me-1"></i>添加用户
                    </a>
                </div>

                <c:if test="${empty users}">
                    <div class="alert alert-info text-center">
                        <h4><i class="fas fa-info-circle me-2"></i>暂无用户数据</h4>
                        <p>系统中还没有用户，请点击上方的"添加用户"按钮创建第一个用户。</p>
                        <a href="/users/new" class="btn btn-primary">立即添加用户</a>
                    </div>
                </c:if>

                <c:if test="${not empty users}">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">用户列表 (共 ${users.size()} 个用户)</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>用户名</th>
                                            <th>邮箱</th>
                                            <th>全名</th>
                                            <th>创建时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${users}" var="user">
                                            <tr>
                                                <td>${user.id}</td>
                                                <td>
                                                    <strong>${user.username}</strong>
                                                </td>
                                                <td>
                                                    <i class="fas fa-envelope me-1"></i>${user.email}
                                                </td>
                                                <td>${user.fullName}</td>
                                                <td>
                                                    <fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                                </td>
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="/users/${user.id}" class="btn btn-sm btn-outline-info" title="查看详情">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                        <a href="/users/${user.id}/edit" class="btn btn-sm btn-outline-warning" title="编辑">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-sm btn-outline-danger" 
                                                                onclick="confirmDelete(${user.id}, '${user.username}')" title="删除">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- 删除确认模态框 -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">确认删除</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>您确定要删除用户 "<span id="deleteUsername"></span>" 吗？</p>
                    <p class="text-danger"><small>此操作不可撤销！</small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <form id="deleteForm" method="post" style="display: inline;">
                        <button type="submit" class="btn btn-danger">确认删除</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete(userId, username) {
            document.getElementById('deleteUsername').textContent = username;
            document.getElementById('deleteForm').action = '/users/' + userId + '/delete';
            new bootstrap.Modal(document.getElementById('deleteModal')).show();
        }
    </script>
</body>
</html>
