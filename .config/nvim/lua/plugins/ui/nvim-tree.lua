local function grep_at_current_tree_node()
  local node = require("nvim-tree.api").tree.get_node_under_cursor()
  if not node then
    return
  end
  require("telescope.builtin").live_grep { cwd = node.absolute_path }
end

local function find_files_at_current_tree_node()
  local node = require("nvim-tree.api").tree.get_node_under_cursor()
  if not node then
    return
  end

  require("telescope.builtin").find_files { cwd = node.absolute_path }
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", config = true },
  },
  cmd = { "NvimTreeToggle" },
  keys = {
    { "<leader>et", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    { "<leader>ep", "<cmd>NvimTreeFindFile<CR>", desc = "Point buffer in File Explorer" },
  },
  opts = {
    hijack_cursor = true,
    respect_buf_cwd = true,
    view = {
      width = 40,
      number = true,
      relativenumber = true,
      -- centralize_selection = true,
      -- { key = { "<Leader>gr", "gr" }, cb = grep_at_current_tree_node, mode = "n" },
    },
    filters = {
      custom = { "^.git$" },
      git_ignored = false,
    },
    tab = {
      sync = {
        open = true,
      },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        window_picker = {
          -- enable = false, -- disable for explorer to work well with window splits
        },
      },
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      --default mappings
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<Leader>fs", grep_at_current_tree_node, opts "Fuzzy find string in current node")
      vim.keymap.set("n", "<leader>ff", find_files_at_current_tree_node, opts "Fuzzy find files in current node")
    end,
  },
  config = function(plugin)
    local tree = require "nvim-tree"

    tree.setup(plugin.opts)
  end,
}
