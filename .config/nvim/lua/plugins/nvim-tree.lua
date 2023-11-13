return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", config = { default = true } },
  },
  cmd = { "NvimTreeToggle" },
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    { "<leader>pf", "<cmd>NvimTreeFindFile<CR>", desc = "Find buffer in file explorer" },
  },
  opts = {
    disable_netrw = false,
    hijack_netrw = true,
    hijack_cursor = true,
    respect_buf_cwd = true,
    view = {
      number = true,
      relativenumber = true,
      centralize_selection = true,
    },
    filters = {
      custom = { ".git" },
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
      },
    },
  },
  config = function(plugin)
    local tree = require("nvim-tree")
    tree.setup(plugin.opts)

    -- change tree background color
    vim.cmd "hi NvimTreeNormal guibg=#24212f"
  end
}
