-- @see https://github.com/nvim-telescope/telescope.nvim/issues/1923
function get_visual_selection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    -- TODO: improve generating regex from visual selection
    return text
  else
    return ""
  end
end

-- Telescope ignore patterns
local telescope_ignore_patterns = {
  "^.git/",
  "^.idea/",
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "[^a-z]stub[^a-z]",
  "[^a-z]spec[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
  "Stub[^a-z]",
  "Spec[^a-z]",
}

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "cljoly/telescope-repo.nvim",
  },
  lazy = false,
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        file_ignore_patterns = telescope_ignore_patterns,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "repo"

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find string in cwd" })
    keymap.set("n", "<leader>fl", "<cmd>Telescope resume<cr>", { desc = "Resume last search" })
    keymap.set("v", "<leader>fs", function()
      local text = get_visual_selection()
      require("telescope.builtin").live_grep { default_text = text }
    end, { desc = "Find selected string in cwd", noremap = true, silent = true })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { desc = "Find Open Buffers" })
    keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
    keymap.set("n", "<leader>fgh", "<cmd>Telescope git_commits<cr>", { desc = "Git History" })
    keymap.set("n", "<leader>fgh", "<cmd>Telescope git_bcommits<cr>", { desc = "Git Buffer History" })
  end,
}
