return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  lazy = false,
  config = function()
    -- import mason
    local mason = require "mason"

    -- import mason-lspconfig
    local mason_lspconfig = require "mason-lspconfig"

    local mason_tool_installer = require "mason-tool-installer"

    local mason_nvim_dap = require "mason-nvim-dap"

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "angularls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "phpactor",
        "gopls",
        "dockerls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }

    mason_tool_installer.setup {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter (sort imports)
        "black", -- python formatter
        "pint", -- php formatter
        "blade-formatter", -- blade template formatter (Laravel)
        "pylint", -- python linter
        "eslint_d", -- js linter
        "golangci-lint", -- go linter
      },
    }

    mason_nvim_dap.setup {
      ensure_installed = {
        "php-debup-adapter",
      },
      automatic_installation = true,
    }
  end,
}
