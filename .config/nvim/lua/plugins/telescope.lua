return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    {
      "<leader>f/",
      function()
        local builtin = require "telescope.builtin"
        builtin.grep_string { search = vim.fn.input "Grep > " }
      end,
      desc = "Find in Files",
    },
  },
  config = true,
}

