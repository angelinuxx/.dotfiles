-- local text_objects = require "plugins.code.treesitter.text-objects"

return {
  {
    -- "nvim-treesitter/nvim-treesitter",
    "dlvandenberg/nvim-treesitter",
    branch = "feature-angular",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      { "dlvandenberg/nvim-treesitter-angular" },
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
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
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
          "dockerfile",
          "gitignore",
          "query",
          "go",
          "python",
          "regex",
          "php",
          -- "blade",
          "phpdoc",
          "sql",
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
        -- -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        -- context_commentstring = {
        --   enable = true,
        --   enable_autocmd = false,
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

      vim.filetype.add {
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      }
    end,
  },
  -- text_objects,
}
