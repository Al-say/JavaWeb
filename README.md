# JavaWeb应用程序

这是一个基于Spring Boot构建的现代JavaWeb应用程序，包含完整的用户管理功能和RESTful API接口。

## 技术栈

- **后端框架**: Spring Boot 2.7.18
- **数据访问**: Spring Data JPA
- **数据库**: MySQL 8.0
- **视图技术**: JSP + JSTL
- **前端框架**: Bootstrap 5
- **构建工具**: Maven
- **开发工具**: Spring Boot DevTools

## 功能特性

- ✅ 用户管理系统（增删改查）
- ✅ RESTful API接口
- ✅ 数据验证和错误处理
- ✅ 响应式Web设计
- ✅ 自动重启和热重载
- ✅ MySQL数据库集成
- ✅ 日志记录

## 项目结构

```
src/
├── main/
│   ├── java/com/example/demo/
│   │   ├── controller/          # 控制器层
│   │   │   ├── HomeController.java
│   │   │   └── UserController.java
│   │   ├── model/               # 实体模型
│   │   │   └── User.java
│   │   ├── repository/          # 数据访问层
│   │   │   └── UserRepository.java
│   │   ├── service/             # 业务逻辑层
│   │   │   └── UserService.java
│   │   └── JavaWebApplication.java # 主启动类
│   ├── resources/
│   │   ├── application.properties  # 配置文件
│   │   └── schema.sql             # 数据库脚本
│   └── webapp/WEB-INF/views/      # JSP视图文件
│       ├── index.jsp              # 首页
│       ├── about.jsp              # 关于页面
│       └── users/                 # 用户管理页面
│           ├── list.jsp           # 用户列表
│           └── form.jsp           # 用户表单
└── test/                          # 测试代码
```

## 环境要求

- Java 11+
- Maven 3.6+
- MySQL 8.0+
- IDE（推荐IntelliJ IDEA或Eclipse）

## 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/your-username/javaweb-demo.git
cd javaweb-demo
```

### 2. 配置数据库

1. 确保MySQL服务已启动
2. 创建数据库：

```sql
CREATE DATABASE javaweb_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. 修改 `src/main/resources/application.properties` 中的数据库连接信息：

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/javaweb_demo?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 3. 编译和运行

```bash
# 编译项目
mvn clean compile

# 运行应用程序
mvn spring-boot:run
```

或者使用IDE直接运行 `JavaWebApplication.java` 主类。

### 4. 访问应用程序

打开浏览器访问：http://localhost:8080

## API接口

### 用户管理API

| 方法 | 路径 | 描述 |
|------|------|------|
| GET | `/users/api` | 获取所有用户 |
| GET | `/users/api/{id}` | 根据ID获取用户 |
| POST | `/users/api` | 创建新用户 |
| GET | `/api/hello` | API测试接口 |

### 示例请求

获取所有用户：
```bash
curl -X GET http://localhost:8080/users/api
```

创建用户：
```bash
curl -X POST http://localhost:8080/users/api \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "password": "123456",
    "email": "test@example.com",
    "fullName": "测试用户"
  }'
```

## 开发指南

### 1. 添加新功能

1. 在 `model` 包中创建实体类
2. 在 `repository` 包中创建数据访问接口
3. 在 `service` 包中实现业务逻辑
4. 在 `controller` 包中创建控制器
5. 在 `views` 目录中创建JSP页面

### 2. 数据库迁移

修改实体类后，Spring Boot会自动更新数据库表结构（通过 `spring.jpa.hibernate.ddl-auto=update`）。

### 3. 配置修改

主要配置文件位于 `src/main/resources/application.properties`，包括：
- 数据库连接
- 服务器端口
- 日志级别
- JSP配置

## 部署

### 1. 打包应用程序

```bash
mvn clean package
```

生成的WAR文件位于 `target/javaweb-demo.war`

### 2. 部署到Tomcat

1. 将生成的WAR文件复制到Tomcat的 `webapps` 目录
2. 启动Tomcat服务器
3. 访问 `http://localhost:8080/javaweb-demo`

### 3. 使用内嵌服务器

```bash
java -jar target/javaweb-demo.war
```

## 故障排除

### 常见问题

1. **数据库连接失败**
   - 检查MySQL服务是否启动
   - 验证数据库连接信息是否正确
   - 确保数据库用户有足够的权限

2. **JSP页面无法显示**
   - 确保已添加Tomcat Jasper依赖
   - 检查JSP配置是否正确

3. **启动失败**
   - 检查端口8080是否被占用
   - 查看控制台错误日志

### 日志查看

应用程序日志会输出到控制台，包含详细的调试信息。可以通过修改 `application.properties` 中的日志级别来调整日志详细程度。

## 贡献

欢迎提交Issue和Pull Request来改进这个项目。

## 许可证

本项目使用MIT许可证。详细信息请查看 [LICENSE](LICENSE) 文件。

## 联系方式

如有问题或建议，请通过以下方式联系：

- Email: your-email@example.com
- GitHub: https://github.com/your-username

---

感谢使用JavaWeb应用程序！🎉
