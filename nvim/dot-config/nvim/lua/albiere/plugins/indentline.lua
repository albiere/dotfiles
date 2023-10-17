local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	indent = {
		char = "│",
	},
	exclude = {
		buftypes = {
			"terminal",
			"nofile",
		},
		filetypes = {
			"help",
			"packer",
			"NvimTree",
			"startify",
		},
	},
})
