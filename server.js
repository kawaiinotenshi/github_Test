// 简单的HTTP服务器脚本
const http = require('http');
const fs = require('fs');
const path = require('path');
const PORT = 8080;

// 确保当前目录正确
const rootDir = process.cwd();
console.log(`服务器将在 ${rootDir} 目录中提供文件`);

// MIME类型映射
const mimeTypes = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon'
};

const server = http.createServer((request, response) => {
    console.log(`${request.method} ${request.url}`);
    
    // 处理根路径请求，返回index.html
    let filePath = path.join(rootDir, request.url === '/' ? 'index.html' : request.url);
    
    // 如果是目录，尝试添加index.html
    const stat = fs.existsSync(filePath);
    const isDirectory = stat && fs.lstatSync(filePath).isDirectory();
    
    if (isDirectory) {
        filePath = path.join(filePath, 'index.html');
    }
    
    // 检查文件是否存在
    fs.exists(filePath, (exists) => {
        if (!exists) {
            response.writeHead(404, { 'Content-Type': 'text/html' });
            response.end(`<html><body><h1>404 Not Found</h1><p>文件不存在: ${filePath}</p></body></html>`);
            return;
        }
        
        // 确定MIME类型
        const extname = String(path.extname(filePath)).toLowerCase();
        const contentType = mimeTypes[extname] || 'application/octet-stream';
        
        // 读取并发送文件
        fs.readFile(filePath, (error, content) => {
            if (error) {
                response.writeHead(500);
                response.end(`错误: ${error.code}`);
            } else {
                response.writeHead(200, { 'Content-Type': contentType });
                response.end(content, 'utf-8');
            }
        });
    });
});

// 启动服务器
server.listen(PORT, () => {
    console.log(`服务器运行在 http://localhost:${PORT}/`);
    console.log('按 Ctrl+C 停止服务器');
});