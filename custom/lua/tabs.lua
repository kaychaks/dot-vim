-- configuration for tabs

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		indicator = { style = "underline" },
		separator_style = "padded_slant",
	},
})
