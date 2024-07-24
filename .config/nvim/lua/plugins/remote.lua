return {
  {
    "coffebar/transfer.nvim", -- Sync files with remote hosts usince rsync and ssh
    lazy = true,
    cmd = {
      "TransferInit",
      "DiffRemote",
      "TransferUpload",
      "TransferDownload",
      "TransferDirDiff",
      "TransferRepeat",
    },
    opts = {},
  },
  {
    "abidibo/nvim-httpyac",
    config = function()
      require("nvim-httpyac").setup()
    end,
    event = "VeryLazy",
    cmd = { "NvimHttpYac", "NvimHttpYacAll" },
    keys = {
      { "<Leader>rr", "<cmd>:NvimHttpYac<CR>", desc = "Run request" },
      { "<Leader>ra", "<cmd>:NvimHttpYacAll<CR>", desc = "Run all requests" },
    },
  },
}
