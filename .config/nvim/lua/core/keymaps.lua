local map = vim.keymap

-- Explorer shortcut <leader>pv
map.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without losing paste buffer
map.set("x", "<leader>p", "\"_dP")

map.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })
map.set("n", "dq", "v/[\"'`]<CR><Left>d<cmd>nohlsearch<CR>", { noremap = true, desc = "Delete up to next quote" })
map.set("n", "yq", "v/[\"'`]<CR><Left>y<cmd>nohlsearch<CR>", { noremap = true, desc = "Yank up to next quote" })
map.set("n", "cq", "v/[\"'`]<CR><Left>di<cmd>nohlsearch<CR>", { noremap = true, desc = "Change up to next quote" })

map.set({ "n", "v" }, "gh", "_", { noremap = true, desc = "Go to start of line" })
map.set({ "n", "v" }, "gl", "$", { noremap = true, desc = "Go to end of line" })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
map.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
map.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
map.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
map.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
map.set({ 'n' }, '<A-h>', '<C-w>h')
map.set({ 'n' }, '<A-j>', '<C-w>j')
map.set({ 'n' }, '<A-k>', '<C-w>k')
map.set({ 'n' }, '<A-l>', '<C-w>l')

map.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to next [D]iagnostic message' })
map.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map.set("n", "yc", "yy<cmd>normal gcc<CR>p", { noremap = true, desc = "Duplicate line and comment original" })

-- Insert keymaps
map.set('i', 'jj', '<Esc>')
map.set('i', 'kk', '<Esc>')
-- lsp keymaps
-- use ctrl+space for code completion with omni function
-- map.set("i", "<C-Space>", vim.lsp.buf.completion, { desc = "Trigger LSP completion"})
map.set("n", "gD", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
map.set("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

-- buffer delete
map.set("n", "bd", vim.cmd.bdelete, { desc = "Delete active buffer" })

-- buffer create
map.set("n", "bn", vim.cmd.tabnew, { desc = "Delete active buffer" })

-- buffer navigation
map.set("n", "b]", function()
  vim.cmd.bnext()
end, {})

map.set("n", "b[", function()
  vim.cmd.bprevious()
end, {})
