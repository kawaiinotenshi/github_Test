# 测试仓库

这是一个用于测试目的的GitHub仓库。

## 项目描述

此仓库用于演示GitHub基本功能和工作流程。

## 项目预览

### GitHub预览选项

GitHub提供以下几种方式来预览HTML项目：

1. **GitHub Pages** - 可以将项目部署为静态网站
   - 在仓库设置中启用GitHub Pages功能
   - 选择分支（推荐使用main分支）
   - 访问自动生成的URL进行预览

2. **CodeSandbox** - 第三方集成
   - 访问：https://codesandbox.io/s/github/kawaiinotenshi/github_Test
   - 可以在浏览器中实时预览和编辑项目

3. **StackBlitz** - 另一个在线预览选项
   - 访问：https://stackblitz.com/github/kawaiinotenshi/github_Test
   - 提供完整的在线开发环境

### 本地预览

在本地环境中，可以通过以下方式预览项目：

```bash
# 启动简单的HTTP服务器
python -m http.server 8080
# 或使用PowerShell
Start-Job -ScriptBlock { $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8080/'); $listener.Start(); while ($listener.IsListening) { $context = $listener.GetContext(); $response = $context.Response; $filePath = Join-Path (Get-Location).Path ($context.Request.Url.LocalPath.TrimStart('/')); if ($filePath -eq (Get-Location).Path) { $filePath = Join-Path $filePath 'index.html'; } if (Test-Path $filePath -PathType Leaf) { $content = [System.IO.File]::ReadAllBytes($filePath); $response.ContentLength64 = $content.Length; $output = $response.OutputStream; $output.Write($content, 0, $content.Length); $output.Close(); } else { $response.StatusCode = 404; $response.Close(); } } }
```

## 项目截图预览

### 主页面预览

下图展示了项目index.html页面的预览效果：

![主页面预览](https://via.placeholder.com/800x400/2c3e50/ffffff?text=项目+主页面+预览)

### 功能模块预览

下图展示了项目的关键功能模块：

![功能模块预览](https://via.placeholder.com/800x400/3498db/ffffff?text=功能+模块+预览)

## 分支管理

项目维护了两个同步的分支：
- `main` - 默认主要分支
- `master` - 同步分支，保持内容一致

详细的分支管理指南请参考 <mcfile name="BRANCH_GUIDE.md" path="BRANCH_GUIDE.md"></mcfile> 文件。