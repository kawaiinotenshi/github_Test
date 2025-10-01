# 测试仓库

这是一个用于测试目的的GitHub仓库。

## 项目描述

此仓库用于演示GitHub基本功能和工作流程。

## 项目预览

### 在GitHub上预览

要在GitHub上直接预览此HTML项目，推荐使用以下方法：

#### 1. 设置GitHub Pages（最佳方案）

GitHub Pages允许您免费托管静态网站：

```
1. 访问您的GitHub仓库页面
2. 点击顶部导航栏的「Settings」
3. 在左侧菜单中选择「Pages」
4. 在「Source」部分选择分支（推荐选择main）
5. 选择「/ (root)」文件夹
6. 点击「Save」按钮
7. 等待几秒钟，GitHub会自动部署您的网站
8. 您将看到一个URL（类似 https://kawaiinotenshi.github.io/github_Test/），通过该URL即可访问预览
```

#### 2. 使用第三方集成服务

如果不想设置GitHub Pages，也可以使用以下第三方服务：

- **CodeSandbox**: https://codesandbox.io/s/github/kawaiinotenshi/github_Test
- **StackBlitz**: https://stackblitz.com/github/kawaiinotenshi/github_Test

### 本地预览

在本地环境中，可以使用我们提供的脚本快速预览：

```powershell
# 使用PowerShell运行（推荐）
./start_server.ps1

# 然后在浏览器中访问
# http://localhost:8081
```

## 项目实际预览效果

以下是项目在GitHub Pages上的预览效果示意图：

### 主页面预览

![主页面预览](https://i.imgur.com/1XzVqL5.png)

### 功能模块预览

![功能模块预览](https://i.imgur.com/2jRk7Bf.png)

> **提示**：设置GitHub Pages后，您可以直接通过自动生成的URL访问项目的实时预览效果，无需任何外部工具。

## 分支管理

项目维护了两个同步的分支：
- `main` - 默认主要分支
- `master` - 同步分支，保持内容一致

详细的分支管理指南请参考 <mcfile name="BRANCH_GUIDE.md" path="BRANCH_GUIDE.md"></mcfile> 文件。