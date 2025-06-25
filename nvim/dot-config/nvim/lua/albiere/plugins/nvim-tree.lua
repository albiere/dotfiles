local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

local function open_win_config_func()
  local scr_w = vim.opt.columns:get()
  local scr_h = vim.opt.lines:get()
  local tree_w = 80
  local tree_h = math.floor(tree_w * scr_h / scr_w)
  return {
    border = "rounded",
    relative = "editor",
    width = tree_w,
    height = tree_h,
    col = (scr_w - tree_w) / 2,
    row = (scr_h - tree_h) / 2
  }
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#ff966c ]])

nvimtree.setup({
  view = {
    signcolumn = "no",
    float = {
      enable = true,
      open_win_config = open_win_config_func
    },
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
    },
  },
  git = {
    ignore = false,
  },
})
