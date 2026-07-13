return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Neovim uses the "sh" filetype; the parser is called "bash".
      vim.treesitter.language.register("bash", "sh")

      local group = vim.api.nvim_create_augroup(
        "user-treesitter",
        { clear = true }
      )

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = {
          "sh",
          "lua",
          "python",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "c",
          "cpp",
          "vim",
          "help",
          "query",
          "markdown",
        },

        callback = function(args)
          local filename = vim.api.nvim_buf_get_name(args.buf)

          -- Avoid parsing huge installers, generated files and embedded payloads.
          if filename ~= "" then
            local stat = vim.uv.fs_stat(filename)

            if stat and stat.size > 1024 * 1024 then
              vim.notify(
                "Tree-sitter disabled for file larger than 1 MiB",
                vim.log.levels.WARN
              )
              return
            end
          end

          local ok, err = pcall(vim.treesitter.start, args.buf)

          if not ok then
            vim.schedule(function()
              vim.notify(
                "Tree-sitter unavailable: " .. tostring(err),
                vim.log.levels.WARN
              )
            end)
          end
        end,
      })
    end,
  },
}
