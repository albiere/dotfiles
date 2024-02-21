local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- tree sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "nvim-treesitter/nvim-treesitter-context", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "RRethy/nvim-treesitter-endwise", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy" },

	-- essential plugins
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-repeat" },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "numToStr/Comment.nvim" },
	{ "Wansmer/treesj", dependencies = { "nvim-treesitter/nvim-treesitter" } },

	-- preferred colorscheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" }, { "nvim-treesitter/nvim-treesitter" } },
	},

	-- managing & installing lsp servers, linters & formatters
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "onsails/lspkind.nvim" },

	-- snippets
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "saadparwaiz1/cmp_luasnip" },

	-- formatting
	{ "stevearc/conform.nvim" },

	-- development
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "neovim"
		end,
	},

	-- great start screen for nvim
	{
		"mhinz/vim-startify",
		config = function()
			vim.g["startify_change_to_dir"] = 0
		end,
	},

	-- indentation guides
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },

	-- git integration
	{ "lewis6991/gitsigns.nvim" },

	-- file explorer
	{ "nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
})
