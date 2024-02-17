local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local luasnip_loaders_status, luasnip_loaders = pcall(require, "luasnip.loaders.from_vscode")
if not luasnip_loaders_status then
	return
end

luasnip_loaders.lazy_load()
luasnip.filetype_extend("ruby", { "rails" })
luasnip.filetype_extend("eruby", { "html" })
