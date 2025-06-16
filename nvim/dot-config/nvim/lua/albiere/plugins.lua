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
  { "nvim-treesitter/nvim-treesitter",             build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "RRethy/nvim-treesitter-endwise",              dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "windwp/nvim-ts-autotag",                      dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "kylechui/nvim-surround",                      version = "*",                                       event = "VeryLazy" },

  -- essential plugins
  { "nvim-lua/plenary.nvim" },
  { "tpope/vim-repeat" },
  { "folke/which-key.nvim",                        event = "VeryLazy" },
  { "windwp/nvim-autopairs",                       event = "InsertEnter" },
  { "numToStr/Comment.nvim" },
  { "Wansmer/treesj",                              dependencies = { "nvim-treesitter/nvim-treesitter" } },

  -- preferred colorscheme
  { "rebelot/kanagawa.nvim" },

  -- Github Copilot
  { "github/copilot.vim" },

  -- development
  { "folke/trouble.nvim",                          cmd = "Trouble" },
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "neovim"
    end,
  },

  -- better notification system
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },

  -- great start screen for nvim
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  -- indentation guides
  { "lukas-reineke/indent-blankline.nvim",      main = "ibl" },

  -- git integration
  { "lewis6991/gitsigns.nvim" },

  -- file explorer
  { "nvim-tree/nvim-tree.lua",                  version = "*",    lazy = false,                              dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope.nvim",            branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}, {
  ui = {
    border = "single",
    backdrop = 100,
  },
})
