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

	-- move lines
	["JJ"] = ':move\'>+<cr>gv',
	["KK"] = ':move-2<cr>gv',

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
	["ge"] = "G",

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

	-- move lines
	["JJ"] = ":move+<CR>",
	["KK"] = ":move-2<CR>",

	-- Other file ops
	["<Leader>fn"] = ":enew<CR>",

	-- clipboard
	["<Leader>p"] = '"+p<CR>',

	-- clear highlight
	["<Leader>hc"] = "<cmd>nohlsearch<cr>",

	-- quit vim
	["<C-q>"] = ":confirm qa<CR>",

	-- increment/decrement
	["+"] = "<C-a>",
	["-"] = "<C-x>",

	-- select all
	["<C-a>"] = "gg<S-v>G",

	-- open nvim config in a separate tab
	["<Leader>oc"] = ":tabfind ~/.config/nvim/init.lua<CR>"
})
