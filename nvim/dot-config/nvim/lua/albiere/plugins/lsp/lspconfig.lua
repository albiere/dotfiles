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

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)              -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)   -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)         -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)     -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)          -- smart rename
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                -- show documentation for what is under cursor
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["ts_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["ruby_lsp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["elixirls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
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
