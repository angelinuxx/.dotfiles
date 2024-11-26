local indent = 4

vim.g.mapleader = " "

-- ui
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.guifont = "Caskavya Cove Nerd Font:h11"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- cursor line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- indentation
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- disable line wrap
vim.opt.wrap = false

-- handle history file and disable swap file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.history = 1000
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

-- searching
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- When searching try to be smart about cases
vim.opt.hlsearch = true -- Highlight all matches
vim.opt.incsearch = true

-- hide current mode
vim.opt.showmode = false -- Do not need to show the mode. We use the statusline instead.

-- keep at least 8 lines from the edges
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

-- decrease timeout and update time
vim.opt.updatetime = 50

-- print limit at 120
vim.opt.colorcolumn = "120"

-- improve search
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true -- ignore case when completing filenames and dirs
vim.opt.wildmode = "longest:full,full" -- builtin completion mode

-- keep the text on the same screen line when opening/closing or resizing horizontal splits
vim.opt.splitkeep = "screen"

-- open new split panes to right and bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

-- enable format on save by default
vim.g.enable_autoformat = true
