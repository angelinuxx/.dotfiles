local indent = 2

vim.g.mapleader = " "

vim.opt.guicursor = ""

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmode = false -- Do not need to show the mode. We use the statusline instead.

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "120"

--vim.o.formatoptions = "jcroqlnt"
--vim.o.shortmess = "filnxtToOFWIcC"

vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true

--vim.opt.breakindent = true
--vim.opt.cmdheight = 0
--vim.opt.completeopt = "menuone,noselect"
--vim.opt.conceallevel = 3
--vim.opt.confirm = true
--vim.opt.cursorline = true
--vim.opt.hidden = true
--vim.opt.inccommand = "nosplit"
--vim.opt.joinspaces = false
--vim.opt.laststatus = 0
--vim.opt.list = true
--vim.opt.mouse = "a"
--vim.opt.pumblend = 10
--vim.opt.pumheight = 10
--vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
--vim.opt.shiftround = true
--vim.opt.showmode = false

vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
