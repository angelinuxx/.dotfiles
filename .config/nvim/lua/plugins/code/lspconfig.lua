return {
  "neovim/nvim-lspconfig",
  priority = 999, -- make sure to load this after mason and mason-lspconfig
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "smjonas/inc-rename.nvim", config = true },
    { "dmmulroy/ts-error-translator.nvim", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gI", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>bd", ":Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", ":lua vim.diagnostic.jump { count = 1 }<cr>", opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", ":lua vim.diagnostic.jump { count = -1 }<cr>", opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    }

    -- configure html server
    lspconfig["html"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure typescript server with plugin
    -- no more need to configure tsserver, typescript-tools.nvim will handle it (see ./typescript.lua)
    --[[ lspconfig["ts_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    } ]]

    -- configure angular server
    local angularls_path = require("mason-registry").get_package("angular-language-server"):get_install_path()
    local cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      vim.fn.getcwd(),
      -- table.concat({ angularls_path, vim.fn.getcwd() }, ","),
      "--ngProbeLocations",
      vim.fn.getcwd(),
      -- table.concat({ angularls_path .. "/node_modules/@angular/language-server", vim.fn.getcwd() }, ","),
    }
    lspconfig["angularls"].setup {
      -- cmd = cmd,
      capabilities = capabilities,
      on_attach = on_attach,
      -- on_new_config = function(new_config, new_root_dir)
      --   new_config.cmd = cmd
      -- end,
      filetypes = { "html", "typescript", "typescriptreact", "angular" },
    }

    -- configure css server
    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["css_variables"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["cssmodules_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["somesass_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescript", "angular", "typescriptreact", "javascriptreact", "javascript" },
    }

    -- configure emmet language server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "php" },
    }

    -- configure yaml language server
    lspconfig["yamlls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml" },
    }

    -- configure sql language server
    lspconfig["sqlls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "sql" },
    }

    -- configure python server
    lspconfig["pyright"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            typeCheckingMode = "off",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace", -- "openFilesOnly",
          },
        },
      },
    }

    -- configure go server
    lspconfig["gopls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          -- usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }

    -- configure php server
    lspconfig["phpactor"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        phpactor = {
          logging = {
            level = "DEBUG",
          },
          indexer = {
            stub_paths = { "%project_root%/.ide-helper" },
          },
        },
      },
    }

    -- configure docker ls
    lspconfig["dockerls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure bash server
    lspconfig["bashls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }
  end,
}
