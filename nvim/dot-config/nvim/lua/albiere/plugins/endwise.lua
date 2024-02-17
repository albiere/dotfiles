local endwise_setup, endwise = pcall(require, "nvim-treesitter.configs")
if not endwise_setup then
	return
end

endwise.setup({
	endwise = {
		enable = true,
	},
})
