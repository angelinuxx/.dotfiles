return {
  "barklan/capslock.nvim",
  event = "VeryLazy",
  config = function()
    require("capslock").setup()
    vim.keymap.set({ "i", "c", "n" }, "<C-g>c", "<Plug>CapsLockToggle", { desc = "Toggle Caps Lock" })
  end,
}
