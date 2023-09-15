-- tree-sitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"rust",
		"javascript",
		"fish",
		"json",
		"markdown",
		"latex",
		"typescript",
		"tsx",
		"toml",
		"yaml",
		"css",
		"html",
	},
	auto_install = true,
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
