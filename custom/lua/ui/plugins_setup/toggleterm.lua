require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", float_ops = { border = "double" } })

function _lazygit_toggle()
	lazygit:toggle()
end

local Lib = require("lib")

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
	-- go to editor
	["<A-e>"] = "<C-\\><C-n><C-w><C-k>",
	-- neovide
	["<D-e>"] = "<C-\\><C-n><C-w><C-k>",
})
