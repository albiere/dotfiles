local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
  return
end

autotag.setup({
  filetypes = { "html", "xml", "eruby" },
})
