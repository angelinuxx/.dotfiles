return {
     "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      -- load the colorscheme
      vim.cmd [[colorscheme rose-pine]]
    end
  }
