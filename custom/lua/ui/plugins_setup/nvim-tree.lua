-- nvim tree plugin configuration and other configuration related to
-- file tree

local Lib = require("lib")

require("nvim-tree").setup()

Lib.nnoremap({
	["<C-F>"] = ":NvimTreeToggle<CR>",
	["<C-s>"] = ":NvimTreeFindFile<CR>",
	["<leader>tr"] = ":NvimTreeRefresh<CR>",
})
