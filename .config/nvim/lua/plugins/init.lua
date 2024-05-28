return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  {
    "vhyrro/luarocks.nvim", -- install luarocks (lua pkg manager) packages directly within neovim
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },
}
