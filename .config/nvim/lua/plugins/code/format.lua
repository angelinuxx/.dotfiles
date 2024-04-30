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
        html = { "djlint" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        php = { "pint" },
        blade = { "blade-formatter" },
        go = { "gofmt", "golines" },
        angular = { "prettier" },
        htmldjango = { "djlint" },
        sql = { "sqlfmt" },
        sh = { "beautysh" },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 5000,
        }
      end,
    }

    -- User command to toggle autoformatting on save
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      }
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
