local keymap = vim.keymap

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "ﴞ",
      [vim.diagnostic.severity.INFO] = "",
    }
  }
})

function lsp_completion(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
  end
end

function lsp_mappings(ev)
  local opts = { noremap = true, silent = true, buffer = ev.buf }
  keymap.set('n', 'grd', "<cmd>Trouble diagnostics<CR>", opts)
  keymap.set('n', 'grs', "<cmd>Trouble lsp_document_symbols<CR>", opts)
  keymap.set('n', 'gd', "<cmd>Trouble lsp_definitions<CR>", opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    lsp_completion(ev)
    lsp_mappings(ev)
  end,
})

vim.lsp.enable({ 'lua', 'ruby', 'html' })
