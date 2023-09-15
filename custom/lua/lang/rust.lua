-- rust specific settings

local Util = require("lang/util")

local rt = require("rust-tools")

rt.setup({
	-- nvim-lspconfig settings
	server = {
		on_attach = Util.on_attach,
		capabilities = Util.capabilities(),
	},
})
