-- Explorer shortcut <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without losing paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })
vim.keymap.set("n", "dq", "v/[\"'`]<CR><Left>d<cmd>nohlsearch<CR>", { noremap = true, desc = "Delete up to next quote" })
vim.keymap.set("n", "yq", "v/[\"'`]<CR><Left>y<cmd>nohlsearch<CR>", { noremap = true, desc = "Yank up to next quote" })
vim.keymap.set("n", "cq", "v/[\"'`]<CR><Left>di<cmd>nohlsearch<CR>", { noremap = true, desc = "Change up to next quote" })

vim.keymap.set({ "n", "v" }, "gh", "_", { noremap = true, desc = "Go to start of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { noremap = true, desc = "Go to end of line" })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set("n", "yc", "yy<cmd>normal gcc<CR>p", { noremap = true, desc = "Duplicate line and comment original" })

-- Insert keymaps
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')
-- lsp keymaps
-- use ctrl+space for code completion with omni function
-- vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion, { desc = "Trigger LSP completion"})
vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

-- buffer navigation
vim.keymap.set("n", "b]", function()
  vim.cmd.bnext()
end, {})

vim.keymap.set("n", "b[", function()
  vim.cmd.bprevious()
end, {})
