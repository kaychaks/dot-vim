local Util = require("lang/util")

require("lspconfig")["tsserver"].setup({
	on_attach = function(c, b)
		Util.on_attach(c, b, true)
	end,
	capabilities = Util.capabilities(),
})
