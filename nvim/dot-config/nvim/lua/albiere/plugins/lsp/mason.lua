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
	},
	PATH = "append",
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"elixirls",
		"rubocop",
	},
	automatic_installation = true,
})
