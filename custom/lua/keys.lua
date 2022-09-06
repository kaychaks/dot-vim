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

	-- quick help
	["<Leader>h"] = ":help ",

	-- quick blank lines
	["<Leader>o"] = "o<Esc>k",
	["<Leader>O"] = "O<Esc>j",

	-- FZF functions
	["<Leader>ff"] = ":Files<CR>",
	["<Leader>bb"] = ":Buffers<CR>",
	["<Leader>gs"] = ":Rg<CR>",

	-- clipboard
	["<Leader>p"] = '"+p<CR>',

	-- quit vim
	["<C-q>"] = ":confirm qa<CR>",
})
