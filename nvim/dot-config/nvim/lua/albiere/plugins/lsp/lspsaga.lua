local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		edit = "<CR>",
	},
	symbol_in_winbar = {
		enable = false,
	},
	diagnostic = {
		on_insert = false,
		on_insert_follow = false,
	},
	ui = {
		title = true, -- This option only works in Neovim 0.9
		border = "solid", -- Border type can be single, double, rounded, solid, shadow.
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
})
