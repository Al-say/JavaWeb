@echo off
chcp 65001 >nul
echo ====================================
echo JavaWeb环境配置指南
echo ====================================
echo.

echo 检查当前环境状态...
echo ---------------------
echo.

echo 1. 检查Java环境:
java -version 2>nul
if %errorlevel% equ 0 (
    echo    [✓] Java已安装
) else (
    echo    [✗] Java未安装
    echo    请下载安装: https://adoptium.net/
)
echo.

echo 2. 检查Maven环境:
mvn -version 2>nul
if %errorlevel% equ 0 (
    echo    [✓] Maven已安装
) else (
    echo    [✗] Maven未安装
    echo    请下载安装: https://maven.apache.org/download.cgi
)
echo.

echo 3. 检查MySQL环境:
mysql --version 2>nul
if %errorlevel% equ 0 (
    echo    [✓] MySQL已安装
) else (
    echo    [!] MySQL未安装（可选）
    echo    推荐安装方式:
    echo    - MySQL官方: https://dev.mysql.com/downloads/mysql/
    echo    - XAMPP: https://www.apachefriends.org/
)
echo.

echo 4. 检查项目文件:
if exist "pom.xml" (
    echo    [✓] pom.xml存在
) else (
    echo    [✗] pom.xml不存在
)

if exist "src\main\java\com\example\demo\JavaWebApplication.java" (
    echo    [✓] 主启动类存在
) else (
    echo    [✗] 主启动类不存在
)
echo.

echo ====================================
echo 环境配置建议
echo ====================================
echo.

echo 如果Java或Maven未安装，请按以下步骤操作:
echo.
echo 方法1: 使用Chocolatey包管理器（推荐）
echo ----------------------------------------
echo 1. 以管理员身份运行PowerShell
echo 2. 安装Chocolatey:
echo    Set-ExecutionPolicy Bypass -Scope Process -Force
echo    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
echo    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
echo.
echo 3. 安装Java和Maven:
echo    choco install openjdk11 -y
echo    choco install maven -y
echo.

echo 方法2: 手动安装
echo ----------------
echo 1. Java JDK 11: https://adoptium.net/
echo 2. Apache Maven: https://maven.apache.org/download.cgi
echo 3. 配置环境变量JAVA_HOME和MAVEN_HOME
echo 4. 将bin目录添加到PATH
echo.

echo 方法3: 使用IDE集成环境
echo ----------------------
echo 1. IntelliJ IDEA Community (免费，内置Maven)
echo 2. Eclipse IDE for Enterprise Java
echo 3. Visual Studio Code + Extension Pack for Java
echo.

echo ====================================
echo 项目启动步骤
echo ====================================
echo.
echo 环境配置完成后，执行以下命令:
echo.
echo 1. 编译项目:
echo    mvn clean compile
echo.
echo 2. 启动应用:
echo    mvn spring-boot:run
echo.
echo 3. 访问应用:
echo    http://localhost:8080
echo.

echo ====================================
echo 数据库配置（可选）
echo ====================================
echo.
echo 如果需要使用MySQL数据库:
echo 1. 安装MySQL 8.0+
echo 2. 创建数据库: CREATE DATABASE javaweb_demo;
echo 3. 修改 src\main\resources\application.properties 中的数据库连接信息
echo.
echo 也可以使用H2内存数据库进行测试（无需安装MySQL）
echo.

pause
