local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- Change the Diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- UI elements
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set('n', 'gD', "<cmd>Trouble lsp_declarations<CR>", opts)
  keymap.set('n', 'gd', "<cmd>Trouble lsp_definitions<CR>", opts)
  keymap.set('n', 'gi', "<cmd>Trouble lsp_implementations<CR>", opts)
  keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

lspconfig["ts_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

lspconfig["ruby_lsp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

lspconfig["elixirls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
