local opt = vim.opt

-- line numbers
opt.number = true -- set numbered lines
opt.relativenumber = true -- show relative line numbers
opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}

-- tabs & indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again

-- line wrapping
opt.wrap = false -- display lines as one long line

-- scroll settings
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

-- search settings
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains uppercase characters.

-- appearance
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.background = "dark" -- colorschemes with dark and light options will always be dark
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.cursorline = true -- highlight the current line
opt.ruler = false -- hide the line and column number of the cursor position
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- status line
opt.laststatus = 3
opt.statusline = "%1*%<%F%m%r%h%w%=%3p%% ● %03v"

-- backspace
-- opt.backspace = "indent,eol,start"          -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- split windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- backup and swap files
opt.backup = false -- creates a backup file
opt.swapfile = false -- creates a swapfile
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- timeout & delays
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster completion (4000ms default)

-- general
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.undofile = true -- enable persistent undo
opt.iskeyword:append("-") -- treats words with `-` as single words

-- plugin specific
opt.completeopt = "menu,menuone,noselect" -- nvim-cmd
