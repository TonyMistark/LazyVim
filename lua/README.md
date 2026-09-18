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

---

# LazyVim 基本使用

## 插件管理

在 Neovim 内执行 `:Lazy` 打开插件管理器界面（快捷键：`i` 安装、`u` 更新、`x` 卸载、`d` 停用、`S` 按文档排序等）。

常用命令：

| 命令 | 作用 |
| --- | --- |
| `:Lazy install` | 安装缺失的插件 |
| `:Lazy update` | 更新插件（记得提交 `lazy-lock.json`） |
| `:Lazy restore` | 按锁文件恢复到精确版本 |
| `:Lazy clean` | 清理不再使用的插件 |
| `:Lazy check` | 检查插件更新状态 |
| `:Lazy reload <插件名>` | 重新加载插件（配置改动后快速生效） |

## 常用快捷键

`<leader>` 默认是**空格键**。按 `<space>` 会弹出 which-key 菜单，输入前缀字母即可看到下一层命令，如 `<space>f` 显示所有查找命令。

| 操作 | 快捷键 |
| --- | --- |
| 查找文件 | `<leader>ff` |
| Git 文件 | `<leader>fg` |
| 最近打开的文件 | `<leader>fr` |
| 项目内搜索文本 | `<leader>fw` |
| 按符号搜索 | `<leader>fs` |
| 缓冲区内搜索 | `<leader>ss` |
| 全局替换 | `<leader>sr` |
| 搜索帮助文档 | `<leader>sh` |
| 文件树 | `<leader>e` |
| 终端（浮动终端） | `<leader>t`（`<leader>tf`） |
| 打开 lazygit | `<leader>gg` |
| Git 状态 / diff / log | `<leader>gs` / `<leader>gd` / `<leader>gl` |
| 跳转定义 / 引用 | `gd` / `gr` |
| 悬停文档 | `K` |
| 重命名 / 代码操作 | `<leader>cr` / `<leader>ca` |
| 行内诊断 | `<leader>cd` |
| 切换窗口 | `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` |
| 关闭当前 Buffer | `<leader>bd` |
| 上一个 / 下一个 Buffer | `[b` / `]b` |
| LazyVim 自带快捷键速查 | `<leader>l` |

> 各版本快捷键可能有差异，最准确的速查表：`<space>l` → LazyVim 菜单，或 `:h lazyvim-keymaps`。

## 使用小贴士

1. **新增插件**：在 `lua/plugins/` 下新建文件（文件名随意，一个文件一个插件更清晰），按需设置 `dependencies`、事件 `event` 或键位 `keys` 实现懒加载；想让插件启动即加载则设置 `lazy = false`。
2. **配置生效**：改动 `lua/config/` 下的选项需要重启 Neovim；插件配置改动可用 `:Lazy reload` 或重启。
3. **常用内置命令**：`:checkhealth` 检查环境依赖；`:Mason` 管理 LSP/格式化器（LazyVim 集成）；`:LspInfo` 查看当前 LSP 状态。
4. **学习资源**：官方文档 https://www.lazyvim.org ；`<space>lR` 打开 LazyVim 参考资料菜单。
5. **不要死记快捷键**：`<space>` 弹出的 which-key 菜单就是活字典，输入前缀字母逐层浏览，常用命令用几次就熟了。