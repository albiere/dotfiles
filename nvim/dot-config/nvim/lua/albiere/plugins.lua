local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	git = {
		clone_timeout = 300,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- preferred colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- essential plugins
	use("RRethy/nvim-treesitter-endwise")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use("numToStr/Comment.nvim")
	use({ "Wansmer/treesj", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({ "folke/which-key.nvim" })
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- development
	use({
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "neovim"
		end,
	})

	-- great start screen for nvim
	use({
		"mhinz/vim-startify",
		requires = { "preservim/vimux" },
		config = function()
			vim.g["startify_change_to_dir"] = 0
		end,
	})

	-- indentation guides
	use("lukas-reineke/indent-blankline.nvim")

	-- git integration
	use("lewis6991/gitsigns.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- fancy icons
	use("nvim-tree/nvim-web-devicons")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- formatting
	use("stevearc/conform.nvim")

	-- vs-code like icons for autocompletion
	use("onsails/lspkind.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets")

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring LSP servers
	use("neovim/nvim-lspconfig")
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- tree sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("nvim-treesitter/nvim-treesitter-context")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
