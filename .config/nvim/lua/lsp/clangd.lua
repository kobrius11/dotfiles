vim.lsp.config('clangd', {
  cmd = { 'clangd', },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'hpp' },
  root_markers = { 'compile_commands.json', '.git' },
})

vim.lsp.enable("clangd")
