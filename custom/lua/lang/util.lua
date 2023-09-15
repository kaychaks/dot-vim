-- some common settings across languages

local Lib = require("lib")
local Util = {}

function Util.on_attach(client, buffnr, no_formatting)
	local bufopts = { buffer = buffnr }

	Lib.nnoremap({
		["K"] = { vim.lsp.buf.hover, bufopts },
		["<leader>ca"] = { vim.lsp.buf.code_action, bufopts },
		["<leader>cf"] = { vim.lsp.buf.formatting_sync, bufopts },
		["<leader>cr"] = { vim.lsp.buf.rename, bufopts },
		["<leader>ch"] = { vim.lsp.buf.signature_help, bufopts },

		-- goto
		["gd"] = { vim.lsp.buf.definition, bufopts },
		["gD"] = { vim.lsp.buf.declaration, bufopts },
		["gT"] = { vim.lsp.buf.type_definition, bufopts },
		["gI"] = { vim.lsp.buf.implementation, bufopts },
		["gr"] = { vim.lsp.buf.references, bufopts },

		-- diagnostics
		["<leader>cd"] = { vim.diagnostic.open_float, bufopts },
	})

	if no_formatting == true then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	vim.api.nvim_buf_create_user_command(buffnr, "Format", function()
		vim.lsp.buf.formatting()
	end, { desc = "Format file with LSP" })

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp_document_highlight",
			pattern = "<buffer>",
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			pattern = "<buffer>",
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return Util
