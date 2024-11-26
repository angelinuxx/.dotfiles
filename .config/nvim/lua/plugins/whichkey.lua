return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>c", group = " Code" },
      { "<leader>d", group = " Dap" },
      { "<leader>e", group = " File explorer" },
      { "<leader>f", group = " Find" },
      { "<leader>g", group = " Git" },
      { "<leader>h", group = " Harpoon" },
      { "<leader>s", group = " Splits" },
      { "<leader>j", group = " Json manipulation" },
      { "<leader>x", group = " Floaterm" },
      { "<leader>xm", group = " Music For Programmers" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
