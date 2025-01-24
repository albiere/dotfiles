local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup({
  auto_close = true,
  auto_preview = false,
  focus = true,
  preview = {
    type = "split",
    relative = "win",
    position = "right",
    size = 0.4,
  }
})
