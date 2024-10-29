local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup({
  ui = {
    border = "single",
    height = 0.8,
    width = 0.8,
  },
  PATH = "append",
})

mason_lspconfig.setup({
  ensure_installed = {
    "emmet_ls",
    "ts_ls",
    "cssls",
    "tailwindcss",
    "ruby_lsp",
    "elixirls",
    "rubocop",
    "lua_ls",
  },
  automatic_installation = true,
})
