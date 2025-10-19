-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    {
      'nvim-lualine/lualine.nvim',
      config = function() require('plugins.lualine') end,
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
      "mason-org/mason.nvim",
      config = function() require('plugins.mason') end,
      opts = {}
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      config = function() require('plugins.telescope') end,
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      config = function() require('plugins.treesitter') end,
      lazy = false,
      build = ":TSUpdate"
    },
    -- themes
--    {
--     "catppuccin/nvim",
--     config = function() require('plugins.colorscheme') end,
--     name = "catppuccin"
--   },
--   {
--     "rose-pine/nvim",
--     config = function() require('plugins.colorscheme') end,
--     name = "rose-pine"
--   },
   {
     'folke/tokyonight.nvim',
     lazy = false,
     config = function() require('plugins.colorscheme') end,
     name = "tokyonight"
   },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

