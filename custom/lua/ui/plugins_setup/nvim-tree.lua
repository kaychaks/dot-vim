-- nvim tree plugin configuration and other configuration related to
-- file tree

local Lib = require("lib")

require("nvim-tree").setup({
	sort_by = "modification_time",
	view = {
		adaptive_size = true,
	},
	renderer = {
		icons = {
			git_placement = "after",
			padding = "  ",
		},
	},
})

Lib.nnoremap({
	["<C-F>"] = ":NvimTreeToggle<CR>",
	["<C-s>"] = ":NvimTreeFindFile<CR>",
	["<leader>tr"] = ":NvimTreeRefresh<CR>",
})
