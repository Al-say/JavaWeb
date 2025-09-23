# JavaWeb快速环境配置
# 使用Chocolatey包管理器自动安装

Write-Host "=====================================" -ForegroundColor Green
Write-Host "JavaWeb环境快速配置 (Chocolatey)" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host ""

# 检查管理员权限
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "请以管理员身份运行此脚本！" -ForegroundColor Red
    Write-Host "右键点击PowerShell图标，选择'以管理员身份运行'" -ForegroundColor Yellow
    pause
    exit 1
}

# 1. 安装Chocolatey
Write-Host "1. 检查Chocolatey包管理器..." -ForegroundColor Blue
try {
    choco --version | Out-Null
    Write-Host "[OK] Chocolatey已安装" -ForegroundColor Green
}
catch {
    Write-Host "[INFO] 正在安装Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Write-Host "[OK] Chocolatey安装完成" -ForegroundColor Green
}
Write-Host ""

# 2. 安装Java
Write-Host "2. 安装Java JDK 11..." -ForegroundColor Blue
try {
    java -version 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Java已安装" -ForegroundColor Green
        java -version
    } else {
        throw "Java未安装"
    }
}
catch {
    Write-Host "[INFO] 正在通过Chocolatey安装Java..." -ForegroundColor Yellow
    choco install openjdk11 -y
    Write-Host "[OK] Java安装完成" -ForegroundColor Green
}
Write-Host ""

# 3. 安装Maven
Write-Host "3. 安装Apache Maven..." -ForegroundColor Blue
try {
    mvn -version 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Maven已安装" -ForegroundColor Green
        mvn -version
    } else {
        throw "Maven未安装"
    }
}
catch {
    Write-Host "[INFO] 正在通过Chocolatey安装Maven..." -ForegroundColor Yellow
    choco install maven -y
    Write-Host "[OK] Maven安装完成" -ForegroundColor Green
}
Write-Host ""

# 4. 安装MySQL (可选)
Write-Host "4. 检查MySQL..." -ForegroundColor Blue
$installMySQL = Read-Host "是否安装MySQL? (y/N)"
if ($installMySQL -eq 'y' -or $installMySQL -eq 'Y') {
    Write-Host "[INFO] 正在通过Chocolatey安装MySQL..." -ForegroundColor Yellow
    choco install mysql -y
    Write-Host "[OK] MySQL安装完成" -ForegroundColor Green
    Write-Host "默认root密码将在安装过程中设置" -ForegroundColor Yellow
} else {
    Write-Host "[SKIP] 跳过MySQL安装" -ForegroundColor Yellow
    Write-Host "如需要，可手动安装：choco install mysql" -ForegroundColor Cyan
}
Write-Host ""

# 5. 配置Maven settings
Write-Host "5. 配置Maven..." -ForegroundColor Blue
$m2Dir = "$env:USERPROFILE\.m2"
if (-not (Test-Path $m2Dir)) {
    New-Item -ItemType Directory -Path $m2Dir -Force | Out-Null
}

$settingsFile = "$m2Dir\settings.xml"
if (-not (Test-Path $settingsFile)) {
    @'
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <mirrors>
    <mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>https://maven.aliyun.com/repository/public</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
</settings>
'@ | Out-File -FilePath $settingsFile -Encoding UTF8
    Write-Host "[OK] Maven配置文件已创建" -ForegroundColor Green
} else {
    Write-Host "[OK] Maven配置文件已存在" -ForegroundColor Yellow
}
Write-Host ""

# 6. 刷新环境变量
Write-Host "6. 刷新环境变量..." -ForegroundColor Blue
refreshenv
Write-Host "[OK] 环境变量已刷新" -ForegroundColor Green
Write-Host ""

# 完成
Write-Host "=====================================" -ForegroundColor Green
Write-Host "环境配置完成！" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host ""

Write-Host "安装的组件:" -ForegroundColor Cyan
Write-Host "✓ Java JDK 11" -ForegroundColor Green
Write-Host "✓ Apache Maven" -ForegroundColor Green
if ($installMySQL -eq 'y' -or $installMySQL -eq 'Y') {
    Write-Host "✓ MySQL Server" -ForegroundColor Green
}
Write-Host ""

Write-Host "下一步操作:" -ForegroundColor Yellow
Write-Host "1. 重新启动PowerShell或命令提示符" -ForegroundColor White
Write-Host "2. 验证安装：" -ForegroundColor White
Write-Host "   java -version" -ForegroundColor Cyan
Write-Host "   mvn -version" -ForegroundColor Cyan
Write-Host "3. 编译项目：" -ForegroundColor White
Write-Host "   mvn clean compile" -ForegroundColor Cyan
Write-Host "4. 运行项目：" -ForegroundColor White
Write-Host "   mvn spring-boot:run" -ForegroundColor Cyan
Write-Host ""

pause
