# 分支管理指南

## 当前状态

- 本地仓库：
  - `master` 分支：包含最新的项目代码
  - `main` 分支：已从master分支创建，内容相同

- 远程仓库：
  - 已有 `master` 分支，包含最新代码
  - 由于网络连接问题，`main` 分支尚未推送到远程

## 后续操作指南

当网络连接恢复后，请执行以下步骤完成分支管理：

### 1. 推送main分支到远程仓库

```bash
# 确保当前在main分支
git checkout main

# 推送main分支到远程仓库
git push -u origin main
```

### 2. 在GitHub上将默认分支从master切换为main

1. 访问GitHub仓库页面：[https://github.com/kawaiinotenshi/github_Test](https://github.com/kawaiinotenshi/github_Test)
2. 点击顶部的 "Settings"（设置）选项卡
3. 在左侧导航栏中选择 "Branches"（分支）
4. 在 "Default branch"（默认分支）部分，点击下拉菜单并选择 "main"
5. 点击 "Update"（更新）按钮确认更改

### 3. 可选：删除远程master分支（在确认main分支正常工作后）

```bash
# 删除远程master分支
git push origin --delete master
```

### 4. 保持分支同步

在进行后续开发时，请确保在main分支上工作：

```bash
# 切换到main分支
git checkout main

# 进行更改后提交
git add .
git commit -m "描述你的更改"

# 推送到远程main分支
git push origin main
```

## 为什么使用main作为默认分支？

GitHub现在使用 `main` 作为新仓库的默认分支名称，这是为了促进更具包容性的开发环境。按照这一最佳实践，可以确保仓库与GitHub的默认设置保持一致，便于团队协作和新贡献者理解。