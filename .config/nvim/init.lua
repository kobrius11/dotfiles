vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.keymap.set("i", "jj", "<Esc>", {
  desc = "Exit insert mode",
})

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", {
  desc = "Save file",
})

vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", {
  desc = "Quit",
})

require("config.lazy")
