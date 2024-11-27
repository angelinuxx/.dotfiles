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
      vim.api.nvim_set_keymap("n", "<leader>xd", ":FloatermNew lazydocker<CR>", { desc = "Lazy Docker" })
      vim.api.nvim_set_keymap("n", "<leader>xg", ":FloatermNew lazygit<CR>", { desc = "Lazy Git" })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>xms",
        ":FloatermNew --name=mfp --silent --title=MusicForProgrammers --position=bottomright --height=0.2 --width=0.4 mfp<CR>",
        { desc = "Music For Programmers Start" }
      )
      vim.api.nvim_set_keymap("n", "<leader>xmt", ":FloatermToggle mfp<CR><ESC>", { desc = "Music For Programmers Toggle" })
      vim.api.nvim_set_keymap("n", "<leader>xmk", ":FloatermKill mfp<CR>", { desc = "Music For Programmers Kill" })

      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
    end,
  },
}
