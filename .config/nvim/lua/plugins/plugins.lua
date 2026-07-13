return {
  "mason-org/mason.nvim",
  'mason-org/mason-lspconfig.nvim',
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {}
  },
  {
    'mg979/vim-visual-multi',
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ['Find Under'] = ''
      }
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate"
  },
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {},
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
  },
  {
     'folke/tokyonight.nvim',
     lazy = false,
     name = "tokyonight"
  },
  'nvim-pack/nvim-spectre',
  'neovim/nvim-lspconfig',
  'jiaoshijie/undotree',
}
