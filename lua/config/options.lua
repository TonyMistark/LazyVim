-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python 语言服务器，由 lang.python extra 读取（该 extra 在 lua/plugins/python.lua 中启用）。
-- 默认值是 "pyright"；设为 "basedpyright" 后，extra 会关掉 pyright、改为启用 basedpyright，
-- ruff 仍然保留，继续负责 lint / format。
-- 选 basedpyright 的原因：诊断规则默认全部开启（比 pyright 的 standard 模式更严格）；
-- Pylance 独占的编辑功能（inlay hints、语义高亮、docstring 补全）在它这个开源
-- server 里被重新实现（Neovim 用不了 Pylance，这点是刚需）；且它在 PyPI 上有发行版，
-- 可以直接锁进项目依赖，而 pyright 只有 npm 包。
-- 配置向后兼容：pyrightconfig.json 与 [tool.pyright] 依然生效。
-- 前提：basedpyright 二进制需由 Mason 装好（:Mason 里搜 basedpyright，依赖 node/npm）。
vim.g.lazyvim_python_lsp = "basedpyright"
