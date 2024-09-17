return {
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    config = function()
      vim.opt.foldcolumn = "1"
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true
      vim.opt.foldtext = ""
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      local ft_map = {
        markdown = "",
        php = "indent",
      }

      local ufo = require "ufo"
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "zR", ufo.openAllFolds, opts)
      keymap.set("n", "zM", ufo.closeAllFolds, opts)
      keymap.set("n", "zK", function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek Fold Under Cursor" })

      ufo.setup {
        provider_selector = function(_, filetype)
          return ft_map[filetype] or { "treesitter", "indent" }
        end,
      }
    end,
  },
}
