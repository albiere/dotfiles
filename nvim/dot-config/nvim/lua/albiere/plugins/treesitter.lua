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
	indent = { enable = false }, -- Breaks ruby code when true ???
	autotag = { enable = true },

	sync_install = false,

	auto_install = true,

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>ss",
			node_incremental = "<leader>si",
			scope_incremental = "<leader>sc",
			node_decremental = "<leader>sd",
		},
	},

	textobjects = {
		select = {
			enable = true,

			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},

			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},

			include_surrounding_whitespace = false,
		},
	},
})
