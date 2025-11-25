require("lsp.lua_ls")
require("lsp.ts_ls")
require("lsp.clangd")

-- global lsp config
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- Diagnostics
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

