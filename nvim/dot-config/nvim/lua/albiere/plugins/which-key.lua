local wk_setup, wk = pcall(require, "which-key")
if not wk_setup then
	return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.setup({
	window = {
		border = "single",
	},
})
