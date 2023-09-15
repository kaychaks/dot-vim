-- tree-sitter
require("nvim-treesitter.configs").setup({
		ensure_installed = {
				"lua",
				"rust",
				"javascript",
				"fish",
				"bash",
				"json",
				"json5",
				"jsonc",
				"markdown",
				"markdown_inline",
				"latex",
				"typescript",
				"tsx",
				"toml",
				"yaml",
				"css",
				"html",
				"help",
				"regex",
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
		-- required for nvim-ts-context-commentstring plugin
		context_commentstring = {
				enable = true,
				enable_autocmd = false,
		},
		incremental_selection = {
				enable = true,
				keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = "<nop>",
						node_decremental = "<bs>",
				},
		},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
