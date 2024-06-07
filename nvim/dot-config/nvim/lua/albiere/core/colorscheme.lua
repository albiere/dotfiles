local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

kanagawa.setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = false },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
	},
	overrides = function(colors)
		return {}
	end,
	theme = "wave",
	background = {
		dark = "wave",
		light = "lotus",
	},
})

vim.cmd.colorscheme("kanagawa")
