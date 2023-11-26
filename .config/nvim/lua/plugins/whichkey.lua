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
      -- d = { name = "+ Dap" },
      h = { name = "+ Harpoon" },
      g = { name = "+ Git" },
    }, { prefix = "<leader>" })
  end,
  -- config = function()
  --   local wk = require "which-key"
  --   wk.setup {
  --     show_help = false,
  --     plugins = { spelling = true },
  --     key_labels = { ["<leader>"] = "<leader>" },
  --     triggers = "auto",
  --   }
  --   wk.register ({
  --     w = { "<cmd>update!<CR>", "Save" },
  --     q = { "<cmd>lua require('util').smart_quit()<CR>", "Quit" },
  --     s = { name = "+Splits" },
  --     f = { name = "+File" },
  --     g = { name = "+Git" },
  --     c = {
  --       name = "+Code",
  --       x = {
  --         name = "Swap Next",
  --         f = "Function",
  --         p = "Parameter",
  --         c = "Class",
  --       },
  --       X = {
  --         name = "Swap Previous",
  --         f = "Function",
  --         p = "Parameter",
  --         c = "Class",
  --       },
  --     },
  --   }, {prefix = "<leader>"})
  -- end,
}
