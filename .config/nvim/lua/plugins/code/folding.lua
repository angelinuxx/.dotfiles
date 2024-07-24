return {
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      local ufo = require "ufo"
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "zR", ufo.openAllFolds, opts)
      keymap.set("n", "zM", ufo.closeAllFolds, opts)

      ufo.setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
}
