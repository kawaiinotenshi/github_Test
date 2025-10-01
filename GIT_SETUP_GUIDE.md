# Git安装与使用指南

## 安装Git

由于您的系统中尚未安装Git命令行工具，请按照以下步骤安装：

### Windows系统安装步骤：

1. 访问 [Git官网下载页面](https://git-scm.com/download/win)
2. 下载适合您系统的Git安装程序（通常是64位版本）
3. 运行安装程序，按照默认选项完成安装
4. 安装完成后，打开命令提示符或PowerShell，输入 `git --version` 验证安装是否成功

## 将文件上传到GitHub

安装Git后，按照以下步骤将本地文件上传到您的GitHub仓库：

1. 打开命令提示符或PowerShell，导航到项目目录：
   ```bash
   cd c:\Users\15071\Documents\trae_projects\github_test
   ```

2. 初始化Git仓库：
   ```bash
   git init
   ```

3. 配置Git用户信息（使用您的GitHub用户名和邮箱）：
   ```bash
   git config --global user.name "kawaiinotenshi"
   git config --global user.email "您的邮箱地址"
   ```

4. 添加所有文件到暂存区：
   ```bash
   git add .
   ```

5. 提交更改：
   ```bash
   git commit -m "初始提交"
   ```

6. 连接到远程GitHub仓库：
   ```bash
   git remote add origin https://github.com/kawaiinotenshi/github_Test.git
   ```

7. 推送到GitHub：
   ```bash
   git push -u origin master
   ```

   首次推送时，您可能需要输入GitHub的用户名和密码/个人访问令牌。

## 其他说明

- 如果您使用GitHub的两步验证，请使用个人访问令牌代替密码
- 您也可以使用GitHub Desktop图形界面工具来简化上述操作
- 本项目已包含基本的.gitignore文件，适合大多数JavaScript项目