local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"dockerfile",
		"gitignore",
		"json",
		"javascript",
		"typescript",
		"yaml",
		"html",
		"css",
		"graphql",
		"bash",
		"lua",
		"vim",
		"elixir",
		"eex",
		"erlang",
		"ruby",
	},

	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
})
