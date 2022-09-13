local Util = require("lang/util")

require("lspconfig")["tailwindcss"].setup({
		on_attach = Util.on_attach,
})
