return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    config = function()
      vim.opt.fillchars:append "diff:╱"
      require("diffview").setup {}
    end,
  },
  --[[ {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    -- enabled = false,
    config = {
      integrations = { diffview = true },
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
      { "<leader>gc", "<cmd>Neogit commit kind=floating<cr>", desc = "Commit" },
      { "<leader>gp", "<cmd>Neogit push kind=floating<cr>", desc = "Push" },
    },
  }, ]]
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame" } },
    config = function()
      require("gitblame").setup { enabled = false }

      -- ({
      --   enable = true,
      --   prefix = " ",
      --   formatter = function (name, blame_info)
      --     if blame_info.author == name then
      --       blame_info.author = "You"
      --     end
      --     local text = string.format(" %s, %s - %s", blame_info.author, blame_info.summary, blame_info.date)
      --     return { text, "GitBlame" }
      --   end,
      --   use_internal_diff = true,
      -- })
    end,
  },
}
