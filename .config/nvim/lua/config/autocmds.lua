-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "<buffer>",
--       once = true,
--       callback = function()
--         vim.cmd(
--           [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
--         )
--       end,
--     })
--   end,
-- })

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "OverseerForm",
    "OverseerList",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- show cursor line only in active window
--vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
--  callback = function()
--    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
--    if ok and cl then
--      vim.wo.cursorline = true
--      vim.api.nvim_win_del_var(0, "auto-cursorline")
--    end
--  end,
--})
--vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
--  callback = function()
--    local cl = vim.wo.cursorline
--    if cl then
--      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
--      vim.wo.cursorline = false
--    end
--  end,
--})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
