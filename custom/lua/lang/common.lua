-- some common settings across languages

local Lib = require("lib")
local Common = {}

function Common.on_attach(client, buffnr)
	local bufopts = { buffer = buffnr }

	Lib.nnoremap({
		["<space>ca"] = { vim.lsp.buf.code_action, bufopts },
		["<space>cf"] = { vim.lsp.buf.formatting_sync, bufopts },
	})
end

return Common
