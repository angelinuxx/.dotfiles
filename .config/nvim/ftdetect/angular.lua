-- autocommand to set angular filetype to angular component template
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.component.html",
    "*.view.html",
    "*.router.html",
  },
  callback = function()
    vim.bo.filetype = "angular"
  end,
})
