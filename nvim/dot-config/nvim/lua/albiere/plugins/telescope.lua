local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

ProjectFiles = function(opts)
	-- opts = opts or {}
	--
	-- vim.fn.system("git rev-parse --is-inside-work-tree")
	--
	-- if vim.v.shell_error == 0 then
	-- 	require("telescope.builtin").git_files(opts)
	-- else
	-- 	require("telescope.builtin").find_files(opts)
	-- end
  -- 
  -- Not sure yet on what behaviour I prefer. Will leave as is for now
		
  require("telescope.builtin").find_files(opts)
end

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		preview = false,
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
		layout_config = {
			horizontal = {
				height = 0.8,
				width = 0.8,
				prompt_position = "bottom",
			},
		},
	},
})

telescope.load_extension("fzf")
