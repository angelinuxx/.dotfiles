return {
  {
    enabled = true,
    "adalessa/laravel.nvim",
    dependencies = {
      -- "nvimtools/none-ls.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
      -- { "<leader>lt", ":Laravel tinker<cr>" },
    },
    config = function()
      require("laravel").setup {
        features = {
          null_ls = {
            enable = false,
          },
        },
      }
      require("telescope").load_extension "laravel"
    end,
  },
  {
    "ccaglak/larago.nvim", -- laravel go to blade/view/components
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = { { "<leader>lg", ":GoBlade<cr>", desc = "Laravel go to blade" } },
  },
  -- {
  --   "jwalton512/vim-blade",
  -- },
  -- {
  -- adoolaard/nvim-cmp-laravel -- autocomplete for route(' in blade files
  -- }
}
