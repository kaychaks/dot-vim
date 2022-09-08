-- some common settings across languages

local Lib = require("lib")
local Util = {}

function Util.on_attach(client, buffnr)
	local bufopts = { buffer = buffnr }

	Lib.nnoremap({
		["<space>ca"] = { vim.lsp.buf.code_action, bufopts },
		["<space>cf"] = { vim.lsp.buf.formatting_sync, bufopts },
	})
end

return Util
