return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local components = require "plugins.ui.statusline.components"

      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          component_separators = {},
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha", "lazy" },
            winbar = {
              "help",
              "alpha",
              "lazy",
            },
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { components.git_repo, "branch" },
          lualine_c = { components.diff, components.diagnostics, components.separator, components.lsp_client },

          lualine_x = {
            components.capslock,
            components.lazy_updates,
            components.codeium,
            "filename",
            components.spaces,
            "encoding",
            "fileformat", -- based on line endings
            "filetype",
            "progress",
          },
          lualine_y = {},
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree", "aerial",  "toggleterm", "quickfix" },
      }
    end,
  },
}
