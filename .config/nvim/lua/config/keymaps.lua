local keymap = vim.keymap.set

vim.g.mapleader = " "

-- open the file explorer
keymap("n", "<leader>pv", vim.cmd.Ex)

-- This is going to get me cancelled:
keymap("i", "<C-c>", "<Esc>")

keymap("n", "Q", "<nop>")

--keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- add x perm to current file
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- keymap("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/angelinuxx/packer.lua<CR>");
keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- source current file
keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Remap for dealing with word wrap
-- keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
-- keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")
keymap("n", "J", "mzJ`z") -- move the line below to current line keeping the cursor at line begin
keymap("n", "<C-u>", "<C-u>zz") -- move half page up keeping cursor in the middle
keymap("n", "<C-d>", "<C-d>zz") -- move half page down keeping cursor in the middle

-- Better escape using jk in insert and terminal mode
-- keymap("i", "jk", "<ESC>")
-- keymap("t", "jk", "<C-\\><C-n>")
-- keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
-- keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
-- keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
-- keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Add undo break-points
-- keymap("i", ",", ",<c-g>u")
-- keymap("i", ".", ".<c-g>u")
-- keymap("i", ";", ";<c-g>u")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
keymap("x", "<leader>p", [["_dP]])

-- greatest remap ever
keymap({"n", "v"}, "<leader>y", [["+y]]) -- yanks to system clipboard
keymap("n", "<leader>Y", [["+Y]]) -- yanks a line to system clipboard

-- delete to void register
keymap({"n", "v"}, "<leader>d", [["_d]])

-- Move Lines
-- move highlighted up 
keymap("n", "<C-J>", ":m .+1<CR>==")
keymap("v", "<C-J>", ":m '>+1<CR>gv=gv")
keymap("i", "<C-J>", "<Esc>:m .+1<CR>==gi")
-- move highlighted down
keymap("n", "<C-K>", ":m .-2<CR>==")
keymap("v", "<C-K>", ":m '<-2<CR>gv=gv")
keymap("i", "<C-K>", "<Esc>:m .-2<CR>==gi")

-- Resize window using <shift> arrow keys
keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Lsp
keymap("n", "<leader>f", vim.lsp.buf.format) -- format
keymap("n", "<C-k>", "<cmd>cnext<CR>zz") -- quickfix navigation
keymap("n", "<C-j>", "<cmd>cprev<CR>zz") -- quickfix navigation
keymap("n", "<leader>k", "<cmd>lnext<CR>zz") -- quickfix navigation
keymap("n", "<leader>j", "<cmd>lprev<CR>zz") -- quickfix navigation

