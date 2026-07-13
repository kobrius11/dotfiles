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

-- PLUGINS
local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd('sleep 200m')
  -- Press 'A' in normal mode after the delay.
  vim.cmd('silent! execute "normal! A"')
end


local remote_sshfs = require('remote-sshfs.api')
local telescope = require('telescope.builtin')
local undotree = require('undotree')
local harpoon = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local wk = require('which-key')
wk.register({
  r = {
    name = 'remote-sshfs',
    c = {remote_sshfs.connect, "Connect to remote sshfs"},
    d = {remote_sshfs.disconnect, "Disconnect from remote sshfs"},
    e = {remote_sshfs.edit, "Edit ssh config"},
  },
  f = {
    name = 'telescope',
    f = {telescope.find_files, 'Telescope find files'},
    p = {telescope.git_files, 'Git file search'},
    g = {telescope.live_grep, 'Telescope live grep'},
    b = {telescope.buffers, 'Telescope buffers'},
  },
  h = {
    name = 'harpoon',
    n = {harpoon.nav_next, 'Navigate next'},
    p = {harpoon.nav_prev, 'Navigate previuos'},
    x = {harpoon_mark.add_file, 'Mark file'},
  },
  n = {
    name = 'NvimTree',
    t = {':NvimTreeToggle<CR>', 'Toggle Neovim Tree', mode = { "n", "i" }}
  },
  g = {
    name = 'neogit',
    g = {'<cmd>Neogit<cr>', 'Show Neogit UI'},
  },
  l = {
    name = "Lspsaga",
    c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    o = { "<cmd>Lspsaga outline<cr>", "Outline" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
    f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
    p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
    s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
    w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
  },
  m = {
    name = "Visual Multi",
    a = { "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
    r = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
    p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
    v = { visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
    o = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
  },
  u = {
    name = "Undotree",
    {undotree.toggle, "Toggle undotree"},
  },
}, { prefix = '<leader>' })
