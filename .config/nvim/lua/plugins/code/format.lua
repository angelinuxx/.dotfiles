return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require "conform"

    conform.setup {
      log_level = vim.log.levels.DEBUG,
      notify_on_error = true,
      formatters = {
        black = {
          args = { "--quiet", "-l", "120", "-" },
        },
        golines = {
          args = { "-m", "120" },
        },
        injected = {
          -- Set to true to ignore errors
          ignore_errors = false,
          -- Map of treesitter language to file extension
          -- A temporary file name with this extension will be generated during formatting
          -- because some formatters care about the filename.
          lang_to_ext = {
            html = "html",
            css = "css",
            scss = "scss",
            bash = "sh",
            c_sharp = "cs",
            elixir = "exs",
            javascript = "js",
            julia = "jl",
            latex = "tex",
            markdown = "md",
            python = "py",
            ruby = "rb",
            rust = "rs",
            teal = "tl",
            typescript = "ts",
            blade = "php",
            php = "php",
            htmldjango = "html",
            sql = "sql",
          },
          -- Map of treesitter language to formatters to use
          -- (defaults to the value from formatters_by_ft)
          lang_to_formatters = {},
        },
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "djlint" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        php = { { "pint", "php-cs-fixer" } },
        blade = { "blade-formatter" },
        go = { "gofmt" },
        gotmpl = { "djlint" },
        angular = { "prettier" },
        htmldjango = { "djlint" },
        sql = { "sqlfmt" },
        sh = { "beautysh" },
      },
      format_on_save = function(bufnr)
        -- skip autoformat if buffer variable disable_autoformat is set, event if enable_autoformat is true
        if vim.b[bufnr].disable_autoformat then
          return
        end
        -- format if one of global or current buffer autoformat is enabled
        if vim.g.enable_autoformat or vim.b[bufnr].enable_autoformat then
          return {
            lsp_fallback = true,
            async = false,
            timeout_ms = 5000,
          }
        end
      end,
    }

    -- User command to toggle autoformatting on save
    vim.api.nvim_create_user_command("FormatEnable", function(args)
      if args.bang then
        -- FormatEnable! will enable formatting just for this buffer
        vim.b.enable_autoformat = true
      else
        vim.g.enable_autoformat = true
      end
    end, {
      desc = "Enable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.enable_autoformat = false
      else
        vim.g.enable_autoformat = false
      end
    end, {
      desc = "Disable autoformat-on-save",
    })

    -- set keybinds
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      }
    end, { desc = "Format file or range (in visual mode)" })

    -- disable autoformat on certain files
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { "*.txt" }, -- add patterns to disable autoformat on
      callback = function()
        vim.b.disable_autoformat = true
      end,
    })
  end,
}
