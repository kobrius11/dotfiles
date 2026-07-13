return {
  "mason-org/mason.nvim",
  'mason-org/mason-lspconfig.nvim',
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'neovim-treesitter/nvim-treesitter',
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
    "neovim-treesitter/nvim-treesitter",
    dependencies = {
      "neovim-treesitter/treesitter-parser-registry",
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local group = vim.api.nvim_create_augroup("treesitter-start", {
        clear = true,
      })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = {
        "bash",
        "sh",
        "c",
        "cpp",
        "javascript",
        "typescript",
        "lua",
        "markdown",
        "python",
      },
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
   end,
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
