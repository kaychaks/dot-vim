local Util = require("lang/util")
local protocol = require("vim.lsp.protocol")

local nvim_lsp = require("lspconfig")

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({

	-- this will run for all servers
	function(server_name)
		nvim_lsp[server_name].setup({
			on_attach = Util.on_attach,
		})
	end,

	-- override for specific servers
	["rust_analyzer"] = function()
		local rt = require("rust-tools")

		rt.setup({
			-- nvim-lspconfig settings
			server = {
				capabilities = capabilities,
				on_attach = Util.on_attach,
			},
		})
	end,

	-- ["tsserver"] = function()
	-- 	nvim_lsp["tsserver"].setup({
	-- 		on_attach = Util.on_attach,
	-- 		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	-- 		cmd = { "typescript-language-server", "--stdio" },
	-- 		capabilities = capabilities,
	-- 	})
	-- end,

	["tailwindcss"] = function()
		nvim_lsp["tailwindcss"].setup({
			on_attach = Util.on_attach,
			capabilities = capabilities,
		})
	end,

	["sumneko_lua"] = function()
		nvim_lsp["sumneko_lua"].setup({
			capabilities = capabilities,
			on_attach = Util.on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
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
	end,

	["emmet_ls"] = function()
		nvim_lsp["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = Util.on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		})
	end,

	["svelte"] = function()
		nvim_lsp["svelte"].setup({
			capabilities = capabilities,
			on_attach = Util.on_attach,
		})
	end,
})
