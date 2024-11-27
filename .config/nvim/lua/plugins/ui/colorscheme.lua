return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      integrations = {
        aerial = true,
        nvim_surround = true,
        noice = true,
        harpoon = true,
        mason = true,
        lsp_trouble = true,
        dadbod_ui = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    vim.cmd.colorscheme "catppuccin"
  end,
}
