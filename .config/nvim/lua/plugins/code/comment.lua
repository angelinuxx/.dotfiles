return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = {
        enable_autocmd = false,
        custom_calculation = function(node, language_tree)
          -- print(vim.bo.filetype)
          print(language_tree._lang)
          if vim.bo.filetype == "blade" then
            return "{{-- %s --}}"
          end
          if vim.bo.filetype == "typescript" and language_tree._lang == "angular" then
            return "<!-- %s -->"
          end
        end,
      },
    },
    config = function()
      local comment = require "Comment"
      local ft = require "Comment.ft"
      local commentFormats = { angular = "<!-- %s -->", django = "{# %s #}" }

      ft.set("angular", commentFormats.angular)
      ft.set("htmldjango", commentFormats.django)

      comment.setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Project todos" },
      { "<leader>t", "<cmd>TodoQuickFix<cr>", desc = "Open todo quick fix" },
    },
  },
}
