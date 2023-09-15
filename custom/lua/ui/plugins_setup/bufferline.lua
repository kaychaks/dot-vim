local Lib = require("lib")

require("bufferline").setup({
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		indicator = { style = "underline" },
		separator_style = "slant",

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})

Lib.nnoremap({
	["<Tab>"] = "<Cmd>BufferLineCycleNext<CR>",
	["<S-Tab>"] = "<Cmd>BufferLineCyclePrev<CR>",
})
