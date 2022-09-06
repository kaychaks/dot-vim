-- rust specific settings

local Common = require("lang/common")

local rt = require("rust-tools")

rt.setup({
	-- nvim-lspconfig settings
	server = {
		on_attach = Common.on_attach,
	},
})
