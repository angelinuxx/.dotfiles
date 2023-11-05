return {
  { 
    'rose-pine/neovim', 
    name = 'rose-pine', 
    priority = 1000, 
    lazy = false,
  },
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "gruvbox" },
          help = { colorscheme = "gruvbox" },
        },
      }
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup()
    end,
  },
}
