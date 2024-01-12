local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "frappe",
	transparent_background = true,
	integrations = {
		telescope = {
			enabled = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
