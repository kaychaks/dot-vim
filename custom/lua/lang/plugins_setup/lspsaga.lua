local saga = require("lspsaga")
local Lib = require("lib")

saga.init_lsp_saga({
	server_filetype_map = {
		typescript = "typescript",
	},
})

Lib.nnoremap({
	["K"] = "<Cmd>Lspsaga hover_doc<CR>",
	["gd"] = "<Cmd>Lspsaga lsp_finder<CR>",
	["<C-j>"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
	["gp"] = "<Cmd>Lspsaga peek_definition<CR>",
	["gr"] = "<Cmd>Lspsaga rename<CR>",
	["<Leader>ca"] = "<Cmd>Lspsaga code_action<CR>",
	["<Leader>@"] = "<Cmd>Lspsaga outline<CR>",
	["<Leader>gg"] = "<cmd>Lspsaga open_floaterm lazygit<CR>",
})

Lib.tnoremap({
	["<C-t>"] = [[<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>]],
})
