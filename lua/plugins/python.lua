return {
  -- Python 语言服务（basedpyright）+ ruff 格式化/检查 + debugpy 调试
  { import = "lazyvim.plugins.extras.lang.python" },

  -- 诊断降噪：把 basedpyright 的默认档 recommended 降到 standard。
  -- standard 会关掉 reportUnknown* / reportAny / reportExplicitAny /
  -- reportMissingParameterType / reportUnusedCallResult / reportImplicitOverride
  -- 这一整套「没标注类型就报」的规则，但仍保留真实的类型错误检查
  -- （reportReturnType / reportArgumentType / reportOptional* / reportAttributeAccessIssue）。
  -- 注意：在 standard 档里把规则设成 "information" 等于「重新启用该规则」，
  -- 不是降级——所以下面要彻底关掉的规则一律用 "none"。
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                  -- 解释器 / venv 没选对时不至于满屏红；正解是用 <leader>cv 选好 venv
                  reportMissingImports = "warning",
                  -- 「库有 stub 但找不到对应源码」，纯噪音
                  reportMissingModuleSource = "none",
                  -- 未使用的 import / 变量交给 ruff（F401 / F841），不必重复报两遍
                  reportUnusedImport = "none",
                  reportUnusedVariable = "none",
                },
              },
            },
          },
        },
      },
    },
  },
}
