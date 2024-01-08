local luasnip_loaders_status, luasnip_loaders = pcall(require, "luasnip.loaders.from_vscode")
if not luasnip_loaders_status then
	return
end

luasnip_loaders.lazy_load()
