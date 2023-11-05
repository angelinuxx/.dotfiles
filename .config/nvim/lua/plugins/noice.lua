return {}
--[[local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = false, -- disable for now
}

function M.config()
  require("noice").setup {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = false,
      cmdline_output_to_split = false,
    },
  }
end

return M
--]]
