return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  keys = {
    { "<leader>lR", vim.cmd.TSToolsRenameFile, desc = "" },
    { "<leader>ai", vim.cmd.TSToolsAddMissingImports, desc = "" },
    { "<leader>ru", vim.cmd.TSToolsRemoveUnusedImports, desc = "Remove unused imports" },
  },
  opts = {
    settings = {
      tsserver_plugins = {
        -- for TypeScript v4.9+
        "@styled/typescript-styled-plugin",
        -- or for older TypeScript versions
        -- "typescript-styled-plugin",,
      },
    },
  },
}
