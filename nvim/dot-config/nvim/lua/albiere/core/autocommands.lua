vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf })
  end,
})
