-- some common settings across languages

local Common = {}


function Common.on_attach(client, buffnr) 
	local map = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = buffnr }

	map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	map('n', '<space>cf', vim.lsp.buf.formatting, bufopts)
	
end

return Common
