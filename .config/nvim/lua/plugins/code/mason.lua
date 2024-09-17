return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "mfussenegger/nvim-dap",
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
        "ts_ls",
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
        "yamlls",
        "sqlls",
        "bashls",
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
        "phpcbf", -- php formatter
        "blade-formatter", -- blade template formatter (Laravel)
        -- "pylint", -- python linter
        "eslint_d", -- js linter
        "golangci-lint", -- go linter
        "golines", -- extends go_fmt to handle long lines wrap
        "djlint", -- django linter and formatter
        "sqlfmt", -- sql formatter
        "beautysh", -- bash formatter
        "shellcheck", -- bash linter
      },
    }

    mason_nvim_dap.setup {
      ensure_installed = {
        "php",
        "delve", -- go debugger
        "go-debug-adapter", -- debug adapter for go
        "python",
      },
      automatic_installation = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        -- function(config)
        --   require("mason-nvim-dap").default_setup(config)
        -- end,
        php = function(config)
          config.configurations = {
            {
              type = "php",
              request = "launch",
              name = "Listen for XDebug",
              hostname = "0.0.0.0",
              port = 9003,
              log = true,
              pathMappings = {
                ["/var/www/sbam/"] = "${workspaceFolder}",
              },
              -- TODO: set up ignored paths (e.g. /favicon.ico)
            },
          }

          require("mason-nvim-dap").default_setup(config) -- don't forget this!
        end,
        --[[ go = function(config)
          config.configurations = {
            {
              type = "go",
              name = "Attach remote",
              mode = "remote",
              request = "attach",
              -- tell which host and port to connect to
              connect = {
                host = "127.0.0.1",
                port = "9004",
              },
              substitutepath = { {
                from = vim.fn.getcwd(),
                to = "/go/src/app",
              } },
            },
          }

          require("mason-nvim-dap").default_setup(config) -- don't forget this!
        end, ]]
      },
    }
  end,
}
