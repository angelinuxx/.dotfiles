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
}
