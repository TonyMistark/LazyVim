# LazyVim 配置管理工作流

## 1. 修改配置

编辑 `~/.config/nvim/lua/` 下的配置文件：

- `lua/plugins/` — 插件配置（每个插件一个文件）
- `lua/config/options.lua` — 编辑器选项
- `lua/config/keymaps.lua` — 键位映射
- `lua/config/autocmds.lua` — 自动命令

## 2. 更新插件

在 Neovim 内执行：

```
:Lazy update
```

更新后 `lazy-lock.json` 可能发生变化，**务必将其一起提交**，它锁定了每个插件的精确版本。

## 3. 提交更改

```bash
cd ~/.config/nvim
git add .
git commit -m "描述你的更改"
```

## 4. 推送到远程

```bash
git push
```

## 5. 在新设备上恢复

```bash
git clone https://github.com/TonyMistark/LazyVim.git ~/.config/nvim
```

1. 启动 Neovim，lazy.nvim 会根据 `lua/plugins/` 自动安装插件
2. 执行 `:Lazy restore` 应用锁文件中记录的精确版本

> 提示：纯本地忽略（如 `.serena/`）写在 `.git/info/exclude`，不会被提交和推送；换新设备后需重新配置。