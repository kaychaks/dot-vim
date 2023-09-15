require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", float_ops = { border = "double" } })

function _lazygit_toggle()
	lazygit:toggle()
end

local Lib = require("lib")

Lib.nnoremap({
	["<Leader>gg"] = "<cmd>lua _lazygit_toggle()<CR>",
	["<A-d>"] = "<cmd>ToggleTerm<CR>",
	["<D-d>"] = "<cmd>ToggleTerm<CR>",
})
