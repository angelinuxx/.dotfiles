-- local text_objects = require "plugins.code.treesitter.text-objects"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require "nvim-treesitter.configs"

      -- configure treesitter
      treesitter.setup { -- enable syntax highlighting
        sync_install = false,
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
          "diff",
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "scss",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "dockerfile",
          "gitignore",
          "query",
          "go",
          "python",
          "regex",
          "php",
          -- "blade", installed manually
          "php_only",
          "phpdoc",
          "sql",
          "angular",
          "htmldjango",
        },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "<C-space>",
        --     node_incremental = "<C-space>",
        --     scope_incremental = false,
        --     node_decremental = "<bs>",
        --   },
        -- },
      }

      -- add blade parser and filetype (for .blade.php files)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      -- additional filetypes
      vim.filetype.add {
        extension = {
          ["env"] = "dotenv",
        },
        filename = {
          [".env"] = "dotenv",
        },
        pattern = {
          [".*%.blade%.php"] = "blade",
          ["%.env%.[%w_.-]+"] = "dotenv",
        },
      }

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.env", "*.env.*" },
        callback = function()
          vim.cmd "set syntax=sh"
        end,
      })
    end,
  },
  -- text_objects,
}
