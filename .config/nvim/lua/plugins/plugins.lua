local lsp_servers = {
  "basedpyright",
  "ruff",
  "lua_ls",
  "ts_ls",
  "clangd",
}

local treesitter_parsers = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "typescript",
  "tsx",
  "python",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
}

local treesitter_filetypes = {
  "sh",
  "c",
  "cpp",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "python",
  "lua",
  "vim",
  "help",
  "query",
  "markdown",
}

return {
  ---------------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------------

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = lsp_servers,

      -- Only enable the servers listed above, rather than every server
      -- that happens to be installed in Mason.
      automatic_enable = lsp_servers,
    },
    config = function(_, opts)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({})
    end,
    keys = {
      {
        "K",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "LSP hover documentation",
      },
      {
        "gd",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Go to definition",
      },
      {
        "gr",
        "<cmd>Lspsaga rename<cr>",
        desc = "Rename symbol",
      },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<cr>",
        mode = { "n", "v" },
        desc = "Code action",
      },
      {
        "[d",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "Previous diagnostic",
      },
      {
        "]d",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "Next diagnostic",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Tree-sitter
  ---------------------------------------------------------------------------

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Installs only missing parsers. It does not reinstall them every time.
      require("nvim-treesitter").install(treesitter_parsers)

      local group = vim.api.nvim_create_augroup("treesitter-highlighting", {
        clear = true,
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = treesitter_filetypes,
        callback = function()
          -- Do not terminate startup when a parser is temporarily unavailable.
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Interface
  ---------------------------------------------------------------------------

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({
            global = false,
          })
        end,
        desc = "Buffer-local keymaps",
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      extensions = {
        "lazy",
        "mason",
        "nvim-tree",
        "quickfix",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Telescope
  ---------------------------------------------------------------------------

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Search text",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Search help",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- File tree
  ---------------------------------------------------------------------------

  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      view = {
        width = 35,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Toggle file tree",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Git
  ---------------------------------------------------------------------------

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
    keys = {
      {
        "<leader>gg",
        "<cmd>Neogit<cr>",
        desc = "Open Neogit",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Harpoon 2
  ---------------------------------------------------------------------------

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Add file to Harpoon",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Open Harpoon",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon file 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon file 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon file 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon file 4",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Remote SSHFS
  ---------------------------------------------------------------------------

  {
    "nosduco/remote-sshfs.nvim",
    cmd = {
      "RemoteSSHFSConnect",
      "RemoteSSHFSDisconnect",
      "RemoteSSHFSReload",
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("remote-sshfs").setup(opts)

      pcall(
        require("telescope").load_extension,
        "remote-sshfs"
      )
    end,
  },

  ---------------------------------------------------------------------------
  -- Search and undo
  ---------------------------------------------------------------------------

  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").toggle()
        end,
        desc = "Search and replace",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({
            select_word = true,
          })
        end,
        desc = "Search current word",
      },
    },
  },

  {
    "jiaoshijie/undotree",
    opts = {},
    keys = {
      {
        "<leader>u",
        function()
          require("undotree").toggle()
        end,
        desc = "Toggle undo tree",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Multiple cursors
  ---------------------------------------------------------------------------

  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "",
      }
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
  },
}
