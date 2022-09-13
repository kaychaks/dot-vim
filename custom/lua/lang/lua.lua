local Util = require("lang/util")

require("lspconfig")["sumneko_lua"].setup({
	on_attach = function(client, buf)
		Util.on_attach(client, buf, true)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})
