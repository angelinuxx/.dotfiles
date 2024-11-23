-- VS code like winbar. File path and context of current cursor position using LSP through nvim-navic
return {
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
      "phelipetls/jsonpath.nvim",
    },
    theme = "catppuccin",
    config = {
      custom_section = function(bufnr)
        -- if filetype is json add jsonpath
        if(vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "json") then
          return "%{%v:lua.require'jsonpath'.get()%}"
        end
        return ""
      end,
    },
  },
}
