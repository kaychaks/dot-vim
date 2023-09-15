-- key mappings

local Lib = require("lib")

-- renaming apis
local g = vim.g

-- leader mapping
g.mapleader = " "

Lib.inoremap({

	-- clear search with esc
	["<esc>"] = "<cmd>noh<cr><esc>",

	-- quick escape
	["jk"] = "<cmd>noh<cr><esc>",

	-- quick save
	["<C-s>"] = "<Esc>:w<CR>a",

	-- quit vi
	["<C-q>"] = "<Esc>:confirm qa<CR>",

	-- add undo breakpoints
	[","] = ",<c-g>u",
	[";"] = ";<c-g>u",
	["."] = ".<c-g>u",
})

Lib.vnoremap({

	-- clipboard functions
	["<Leader>y"] = '"+y<CR>',
	["<Leader>d"] = '"+d<CR>',
	["<Leader>p"] = '"+p<CR>',

	-- move lines
	["JJ"] = "m '>+1<cr>gv=gv",
	["KK"] = ":m '<-2<cr>gv=gv",

	-- quit vi
	["<C-q>"] = "<Esc>:confirm qa<CR>",

	-- better indenting
	[">"] = ">gv",
	["<"] = "<gv",
})

Lib.nnoremap({

	-- clear search with esc
	["<esc>"] = "<cmd>noh<cr><esc>",

	-- better up/down
	["j"] = { "v:count == 0 ? 'gj' : 'j'", { expr = true } },
	["k"] = { "v:count == 0 ? 'gk' : 'k'", { expr = true } },

	-- quick save
	["<Leader>s"] = ":w<CR>",

	-- kill buffer
	-- ["<Leader>q"] = ":Bdelete<CR>",

	-- reload
	["<Leader>r"] = ":source %<CR>",

	-- quick load last buffer
	["<Leader><Leader>"] = "<cmd>e #<CR>",

	-- navigate buffer
	["<Leader>]"] = ":bn<CR>",
	["<Leader>["] = ":bp<CR>",
	["ge"] = "G",

	["gw"] = "*N",

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


	["<Leader>wd"] = "<C-w>c",

	-- move lines
	["JJ"] = ":m .+1<cr>==",
	["KK"] = ":m .-2<cr>==",

	-- Other file ops
	
	-- new file
	["<Leader>fn"] = "<cmd>enew<CR>",

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
	["<Leader>oc"] = ":tabfind ~/.config/nvim/init.lua<CR>",
})

Lib.xnoremap({
	["gw"] = "*N",
})
