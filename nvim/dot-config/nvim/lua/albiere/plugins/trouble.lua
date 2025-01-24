local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup({
  focus = true,
  preview = {
    type = "split",
    relative = "win",
    position = "right",
    size = 0.4,
  },
  win = {
    size = {
      height = 0.35
    }
  },
  keys = {
    ["<cr>"] = "jump_close"
  }
})
