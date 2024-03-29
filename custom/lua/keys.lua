-- key mappings

local Lib = require("lib")

-- renaming apis
local g = vim.g

-- leader mapping
g.mapleader = " "

Lib.inoremap({

	-- quick escape
	["jk"] = "<Esc>",

	-- quick save
	["<C-s>"] = "<Esc>:w<CR>a",

	-- quit vi
	["<C-q>"] = "<Esc>:confirm qa<CR>",
})

Lib.vnoremap({

	-- clipboard functions
	["<Leader>y"] = '"+y<CR>',
	["<Leader>d"] = '"+d<CR>',
	["<Leader>p"] = '"+p<CR>',

	-- quit vi
	["<C-q>"] = "<Esc>:confirm qa<CR>",
})

Lib.nnoremap({
	-- quick save
	["<Leader>s"] = ":w<CR>",

	-- kill buffer
	["<Leader>q"] = ":Bdelete<CR>",

	-- reload
	["<Leader>r"] = ":source %<CR>",

	-- quick load last buffer
	["<Leader><Leader>"] = ":b#<CR>",

	-- navigate buffer
	["<Leader>]"] = ":bn<CR>",
	["<Leader>["] = ":bp<CR>",

	-- split window
	["<Leader>\\"] = ":vsp<CR>:wincmd l<CR>",
	["<Leader>-"] = ":sp<CR>:wincmd j<CR>",

	-- navigate window
	["<Leader>wl"] = ":wincmd l<CR>",
	["<Leader>wj"] = ":wincmd j<CR>",
	["<Leader>wh"] = ":wincmd h<CR>",
	["<Leader>wk"] = ":wincmd k<CR>",

	-- move window
	["<Leader>wL"] = "<C-w>L",
	["<Leader>wJ"] = "<C-w>J",
	["<Leader>wH"] = "<C-w>H",
	["<Leader>wK"] = "<C-w>K",

	-- kill window
	["<Leader>wq"] = "<C-w>q",

	-- quick help
	["<Leader>h"] = ":help ",

	-- quick blank lines
	["<Leader>o"] = "o<Esc>k",
	["<Leader>O"] = "O<Esc>j",

	-- FZF functions
	["<Leader>ff"] = ":GFiles<CR>",
	["<Leader>fa"] = ":Files<CR>",
	["<Leader>bb"] = ":Buffers<CR>",
	["<Leader>gs"] = ":Rg<CR>",

	-- Other file ops
	["<Leader>fn"] = ":enew<CR>",

	-- clipboard
	["<Leader>p"] = '"+p<CR>',

	-- clear highlight
	["<Leader>hc"] = "<cmd>nohlsearch<cr>",

	-- session manager
	["<leader>Ss"] = "<cmd>SessionManager! save_current_session<cr>",
	["<leader>Sl"] = "<cmd>SessionManager! load_last_session<cr>",
	["<leader>S."] = "<cmd>SessionManager! load_current_dir_session<cr>",

	-- quit vim
	["<C-q>"] = ":confirm qa<CR>",
})
