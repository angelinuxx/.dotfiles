return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    enabled = false,
    keys = {
      -- { "<leader>xt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      -- { "<leader>xd", "<cmd>TermExec cmd='lazydocker' direction='float'<cr>", desc = "Lazy Docker" },
    },
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>xd", ":FloatermNew lazydocker<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>xg", ":FloatermNew lazygit<CR>", {})

      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
    end,
  },
}
