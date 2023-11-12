return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  },
  opts = {
    --    open_on_setup = true,
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
}
