local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		java = false, -- don't check treesitter on java
	},
})
