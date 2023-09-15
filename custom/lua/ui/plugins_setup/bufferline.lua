local Lib = require("lib")

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		indicator = { style = "underline" },
		separator_style = "padded_slant",
	},
})

Lib.nnoremap({
	["<Tab>"] = "<Cmd>BufferLineCycleNext<CR>",
	["<S-Tab>"] = "<Cmd>BufferLineCyclePrev<CR>",
})
