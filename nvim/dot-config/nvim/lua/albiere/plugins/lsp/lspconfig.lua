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

function lsp_notification(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  vim.notify('LSP (' .. client.name .. '): Attached!', vim.log.levels.INFO)

  if client then
    client.handlers['$/progress'] = function(_, result, ctx)
      local value = result.value
      if value.kind == 'begin' then
        vim.notify('LSP (' .. client.name .. '): Starting...', vim.log.levels.INFO)
      elseif value.kind == 'report' then
        vim.notify('LSP (' .. client.name .. '): ' .. value.message, vim.log.levels.INFO)
      elseif value.kind == 'end' then
        vim.notify('LSP (' .. client.name .. '): Initialization Complete!', vim.log.levels.INFO)
      end
    end
  end
end

-- Override the default hover function to use a custom border and size
-- global winborder breaks Telescope, so we use a custom hover function instead
local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
  return hover({ border = "rounded" })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    lsp_completion(ev)
    lsp_mappings(ev)
    lsp_notification(ev)
  end,
})

vim.lsp.enable({ 'lua', 'ruby', 'html' })
