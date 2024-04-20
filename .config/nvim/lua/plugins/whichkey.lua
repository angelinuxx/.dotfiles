return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require "which-key"
    wk.setup {
      key_labels = { ["<leader>"] = "<leader>" },
    }
    wk.register({
      f = { name = "+ Find" },
      s = { name = "+ Splits" },
      e = { name = "+ File explorer" },
      c = { name = "+ Code" },
      d = { name = "+ Dap" },
      h = { name = "+ Harpoon" },
      g = { name = "+ Git" },
    }, { prefix = "<leader>" })
  end,
}
