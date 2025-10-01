# 简单的PowerShell HTTP服务器
# 设置服务器端口和目录
$port = 8080
$rootDir = Get-Location

# 创建监听器
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

# 启动服务器
$listener.Start()
Write-Host "服务器正在运行: http://localhost:$port/"
Write-Host "当前目录: $rootDir"
Write-Host "按 Ctrl+C 停止服务器"

# 处理请求的函数
function SendFileResponse($response, $filePath) {
    try {
        # 获取文件内容
        [byte[]]$content = [System.IO.File]::ReadAllBytes($filePath)
        
        # 设置响应头
        $extension = [System.IO.Path]::GetExtension($filePath).ToLower()
        $contentType = switch ($extension) {
            ".html" { "text/html" }
            ".js" { "text/javascript" }
            ".css" { "text/css" }
            ".json" { "application/json" }
            ".png" { "image/png" }
            ".jpg" { "image/jpeg" }
            ".gif" { "image/gif" }
            ".svg" { "image/svg+xml" }
            default { "application/octet-stream" }
        }
        
        $response.ContentType = $contentType
        $response.ContentLength64 = $content.Length
        
        # 发送响应
        $output = $response.OutputStream
        $output.Write($content, 0, $content.Length)
        $output.Close()
        
        Write-Host "200 OK: $filePath"
    } catch {
        Write-Host "错误处理文件: $_"
        $response.StatusCode = 500
        $response.Close()
    }
}

# 主循环
while ($listener.IsListening) {
    # 获取上下文
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    # 记录请求
    Write-Host "请求: $($request.Url.LocalPath)"
    
    # 解析文件路径
    $localPath = $request.Url.LocalPath.TrimStart('/')
    if ([string]::IsNullOrEmpty($localPath)) {
        # 根路径请求index.html
        $localPath = "index.html"
    }
    
    # 构建完整路径
    $filePath = Join-Path $rootDir $localPath
    
    # 检查是否是目录
    if (Test-Path $filePath -PathType Container) {
        # 如果是目录，尝试加载index.html
        $filePath = Join-Path $filePath "index.html"
    }
    
    # 检查文件是否存在
    if (Test-Path $filePath -PathType Leaf) {
        # 文件存在，发送文件
        SendFileResponse $response $filePath
    } else {
        # 文件不存在，返回404
        Write-Host "404 Not Found: $filePath"
        $response.StatusCode = 404
        
        # 创建简单的404页面
        $errorPage = @"
<!DOCTYPE html>
<html>
<head>
    <title>404 Not Found</title>
</head>
<body>
    <h1>404 Not Found</h1>
    <p>找不到文件: $localPath</p>
    <p>当前目录: $rootDir</p>
</body>
</html>
"@
        
        $errorBytes = [System.Text.Encoding]::UTF8.GetBytes($errorPage)
        $response.ContentLength64 = $errorBytes.Length
        $response.OutputStream.Write($errorBytes, 0, $errorBytes.Length)
        $response.Close()
    }
}

# 停止服务器（如果循环退出）
$listener.Stop()
Write-Host "服务器已停止"