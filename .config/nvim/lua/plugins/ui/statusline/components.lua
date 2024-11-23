local icons = require "config.icons"
local lazy_status = require "lazy.status"

return {
  capslock = {
   require "capslock".status_string,
  },
  unsaved = {
    function()
      if vim.bo.modified then
        return icons.ui.Unsaved
      end
      return ""
    end,
    padding = 1,
    color = { fg = "#456cb5" },
  },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
      return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
  },
  lazy_updates = {
    lazy_status.updates,
    cond = lazy_status.has_updates,
    color = { fg = "#ff9e64" },
  },
  git_repo = {
    function()
      if #vim.api.nvim_list_tabpages() > 1 and vim.fn.trim(vim.fn.system "git rev-parse --is-inside-work-tree") == "true" then
        return vim.fn.trim(vim.fn.system "basename `git rev-parse --show-toplevel`")
      end
      return ""
    end,
  },
  codeium = {
    function()
      return vim.api.nvim_call_function("codeium#GetStatusString", {})
    end,
    icon = icons.ai.Codeium,
    color = { fg = "#09b6a2" },
  },
  separator = {
    function()
      return "%="
    end,
  },
  diff = {
    "diff",
    colored = false,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    diagnostics_color = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
    },
    colored = true,
  },
  lsp_client = {
    function(msg)
      msg = msg or ""
      local buf_clients = vim.lsp.get_clients { bufnr = 0 }

      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return ""
        end
        return msg
      end

      -- local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        table.insert(buf_client_names, client.name)
      end

      -- -- add formatter
      -- local lsp_utils = require "plugins.lsp.utils"
      -- local formatters = lsp_utils.list_formatters(buf_ft)
      -- vim.list_extend(buf_client_names, formatters)
      --
      -- -- add linter
      -- local linters = lsp_utils.list_linters(buf_ft)
      -- vim.list_extend(buf_client_names, linters)
      local linters = require("lint").get_running()
      local linter_info = ""
      if #linters == 0 then
        linter_info = icons.ui.BadgeVerified
      end
      table.sort(linters)
      linter_info = icons.ui.SearchFocus .. " " .. table.concat(linters, ", ")

      -- -- add hover
      -- local hovers = lsp_utils.list_hovers(buf_ft)
      -- vim.list_extend(buf_client_names, hovers)
      --
      -- -- add code action
      -- local code_actions = lsp_utils.list_code_actions(buf_ft)
      -- vim.list_extend(buf_client_names, code_actions)

      local hash = {}
      local client_names = {}
      for _, v in ipairs(buf_client_names) do
        if not hash[v] then
          client_names[#client_names + 1] = v
          hash[v] = true
        end
      end
      table.sort(client_names)
      local lsp_info = icons.ui.Code .. " " .. table.concat(client_names, ", ")

      return lsp_info--[[  .. " " .. linter_info ]]
    end,
    colored = true,
    on_click = function()
      vim.cmd [[LspInfo]]
    end,
  },
}
