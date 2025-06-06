local keymap = vim.keymap

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

function lsp_completion(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
  end
end

function lsp_mappings(ev)
  local opts = { noremap = true, silent = true, buffer = ev.buf }
  keymap.set('n', 'gd', "<cmd>Trouble lsp_definitions<CR>", opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    lsp_completion(ev)
    lsp_mappings(ev)
  end,
})

vim.lsp.enable({ 'lua', 'ruby', 'html' })
