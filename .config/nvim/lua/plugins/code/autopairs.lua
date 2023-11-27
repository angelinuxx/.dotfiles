return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require "nvim-autopairs"

    -- configure autopairs
    autopairs.setup {
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    }

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require "cmp"

    local ts_utils = require "nvim-treesitter.ts_utils"

    local ts_node_func_parens_disabled = {
      -- ecma
      named_imports = true,
      -- rust
      use_declaration = true,
    }

    local default_handler = cmp_autopairs.filetypes["*"]["("].handler
    cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
      local node_type = ts_utils.get_node_at_cursor():type()
      if ts_node_func_parens_disabled[node_type] then
        if item.data then
          item.data.funcParensDisabled = true
        else
          char = ""
        end
      end
      default_handler(char, item, bufnr, rules, commit_character)
    end

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
