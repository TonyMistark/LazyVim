return {
  -- 1. 添加 gruvbox 主题插件
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- 确保优先加载
  },
  -- 2. 配置 LazyVim 使用 gruvbox 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
