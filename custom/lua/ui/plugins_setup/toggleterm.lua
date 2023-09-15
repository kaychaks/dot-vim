require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", float_ops = { border = "double" } })

function _lazygit_toggle()
	lazygit:toggle()
end

local Lib = require("lib")

function __New_term()
	local a, _ = require("toggleterm.terminal").identify()
	local term = Terminal:new({ count = a + 1 })
	term:toggle()
end

Lib.nnoremap({
	-- show lg
	["<Leader>gg"] = "<cmd>lua _lazygit_toggle()<CR>",
	-- toggle term
	["<A-d>"] = "<cmd>ToggleTerm<CR>",
	-- neovide
	["<D-d>"] = "<cmd>ToggleTerm<CR>",
})

Lib.tnoremap({
	-- toggle term
	["<A-d>"] = "<cmd>ToggleTerm<CR>",
	-- neovide
	["<D-d>"] = "<cmd>ToggleTerm<CR>",
	["<D-S-d>"] = "<cmd>ToggleTermToggleAll<CR>",
	-- go to editor
	["<A-e>"] = "<C-\\><C-n><C-w><C-k>",
	-- neovide
	["<D-e>"] = "<C-\\><C-n><C-w><C-k>",

	-- go to command mode
	["<esc>"] = "<C-\\><C-n>",
	-- open a new terminal on the side
	["<A-t>"] = "<C-\\><C-n><cmd>lua __New_term()<CR>",
	["<D-t>"] = "<C-\\><C-n><cmd>lua __New_term()<CR>",
})
