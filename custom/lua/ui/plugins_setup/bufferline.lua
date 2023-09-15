local Lib = require("lib")

require("bufferline").setup({
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		indicator = { style = "underline" },
		separator_style = "slant",
	},
})

Lib.nnoremap({
	["<Tab>"] = "<Cmd>BufferLineCycleNext<CR>",
	["<S-Tab>"] = "<Cmd>BufferLineCyclePrev<CR>",
})
