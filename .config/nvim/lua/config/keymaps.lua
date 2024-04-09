local keymap = vim.keymap.set

-- remove keymaps on space
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap("n", "Q", "<nop>")

-- add x perm to current file
--keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- disable search highlight
keymap("n", "<leader>nh", ":nohlsearch<CR>")

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")
keymap("n", "<C-u>", "<C-u>zz") -- move half page up keeping cursor in the middle
keymap("n", "<C-d>", "<C-d>zz") -- move half page down keeping cursor in the middle

-- better escape using jk in insert and terminal mode
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
keymap("n", "x", [["_x]]) -- single char delete to void register
keymap({ "n", "v" }, "<leader>y", [["+y]]) -- yanks to system clipboard
keymap("n", "<leader>Y", [["+Y]]) -- yanks a line to system clipboard

-- delete to void register
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Move Lines
-- move highlighted up
--keymap("n", "<C-J>", ":m .+1<CR>==")
--keymap("v", "<C-J>", ":m '>+1<CR>gv=gv")
--keymap("i", "<C-J>", "<Esc>:m .+1<CR>==gi")
-- move highlighted down
-- keymap("n", "<C-K>", ":m .-2<CR>==")
-- keymap("v", "<C-K>", ":m '<-2<CR>gv=gv")
-- keymap("i", "<C-K>", "<Esc>:m .-2<CR>==gi")

-- remap split windows
keymap("n", "<leader>sv", "<C-w>v") -- split vertically
keymap("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split

-- Resize window using <shift> arrow keys
keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")
