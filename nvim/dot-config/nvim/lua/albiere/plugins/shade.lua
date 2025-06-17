local shade_setup, shade = pcall(require, "shade")
if not shade_setup then
  return
end

shade.setup({
  overlay_opacity = 50,
  opacity_step = 1,
})
