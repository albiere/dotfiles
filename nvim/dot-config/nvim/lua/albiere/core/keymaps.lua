-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- remap vim 0 to first non-blank character
keymap.set("n", "0", "^")

-- move down/up and maintain cursor at the middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- On search, maintain cursor at the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- window management
keymap.set("n", "<C-j>", "<C-W>j")
keymap.set("n", "<C-k>", "<C-W>k")
keymap.set("n", "<C-h>", "<C-W>h")
keymap.set("n", "<C-l>", "<C-W>l")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- move lines in visual mode. Super useful!
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- quickly open and reload vim config
keymap.set("n", "<leader>ve", "<cmd>e $MYVIMRC<CR>")
keymap.set("n", "<leader>vr", "<cmd>source $MYVIMRC<CR>")

---------------------
-- Plugins Keymaps
---------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", ";", "<CMD>lua ProjectFiles()<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")
