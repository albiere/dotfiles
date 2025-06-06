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
		local theme = colors.theme
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
      PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
      PmenuKind = { fg = "none", bg = theme.ui.bg_p1 },
      PmenuKindSel = { fg = "none", bg = theme.ui.bg_p2 },
      PmenuExtra = { fg = theme.ui.special, bg = theme.ui.bg_p1 },
      PmenuExtraSel = { fg = "none", bg = theme.ui.bg_p2 },
		}
	end,
	theme = "wave",
	background = {
		dark = "wave",
		light = "lotus",
	},
})

vim.cmd.colorscheme("kanagawa")
