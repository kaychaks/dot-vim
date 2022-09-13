-- configuring diagnostics for lsp

local sign_define = vim.fn.sign_define
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focused = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- trouble config
local Lib = require("lib")
Lib.nnoremap({
	["<leader>xx"] = { "<cmd>TroubleToggle<cr>" },
	["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>" },
	["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>" },
	["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>" },
	["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>" },
	["<leader>xR"] = { "<cmd>TroubleToggle lsp_references<cr>" },
})
