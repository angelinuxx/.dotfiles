return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    -- "nvim-telescope/telescope-project.nvim",
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
        find_files = {
          hidden = true,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "repo"

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope repo list<cr>", { desc = "Git Repos" })
    -- keymap.set("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Projects" })
  end,
}
