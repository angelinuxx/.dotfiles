return {
  {
    "vuki656/package-info.nvim", -- Handle node package manager (npm, yarn, pnpm) info and commands
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup()
    end,
    keys = {
      { "<leader>ns", "<cmd>lua require('package-info').show({ force = true })<cr>", { silent = true, noremap = true } },
    },
  },
}
