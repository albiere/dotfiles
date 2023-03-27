local setup_trouble, trouble = pcall(require, "trouble")
if not setup_trouble then
	return
end

trouble.setup({})
