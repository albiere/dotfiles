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

keymap.set("t", "<C-n>", [[<C-\><C-n>gg]])

-- quickfix
keymap.set("n", "<C-j>", ":cnext<CR>")
keymap.set("n", "<C-k>", ":cprev<CR>")

-- completion popup
keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    return '<Tab>'
  end
end, { expr = true, desc = 'Next completion or tab' })

keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end, { expr = true, desc = 'Previous completion or shift-tab' })

---------------------
-- Plugins Keymaps
---------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<C-p>", "<CMD>lua ProjectFiles()<CR>")
keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- treesj
keymap.set("n", "J", ":TSJToggle<CR>")

-- vim-test
keymap.set("n", "tt", ":TestNearest<CR>")
keymap.set("n", "tf", ":TestFile<CR>")
keymap.set("n", "tl", ":TestLast<CR>")
keymap.set("n", "tv", ":TestVisit<CR>")

-- vim-projectionist
keymap.set("n", "<leader>a", ":A<CR>", { desc = "Alternate file" })
