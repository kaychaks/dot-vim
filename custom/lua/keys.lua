-- key mappings

-- renaming apis
local g = vim.g
local map = vim.api.nvim_set_keymap

-- leader mapping
g.mapleader = " "

-- quick escape
map("i", "jk", "<Esc>", {})

-- quick save
map("n", "<Leader>w", ":w<CR>", { nowait = true })
map("i", "<C-s>", "<Esc>:w<CR>a", {})

-- quick quit
map("n", "<Leader>q", ":q<CR>", { noremap = true })

-- reload buffer
map("n", "<Leader>r", ":source %<CR>", { noremap = true, silent = true })

-- quick change to last buffer
map("n", "<Leader><Leader>", ":b#<CR>", { silent = true })

-- switch buffers
map("n", "<Leader>]", ":bn<CR>", {})
map("n", "<Leader>[", ":bp<CR>", {})

-- create new windows
map("n", "<Leader>\\", ":vsp<CR>:wincmd l<CR>", { noremap = true })
map("n", "<Leader>-", ":sp<CR>:wincmd j<CR>", { noremap = true })

-- switch windows
map("n", "<Leader>wl", ":wincmd l<CR>", { noremap = true, silent = true })
map("n", "<Leader>wj", ":wincmd j<CR>", { noremap = true, silent = true })
map("n", "<Leader>wh", ":wincmd h<CR>", { noremap = true, silent = true })
map("n", "<Leader>wk", ":wincmd k<CR>", { noremap = true, silent = true })

-- begin help
map("n", "<Leader>h", ":help ", { noremap = true })

-- new line below & above without moving from present line
map("n", "<Leader>o", "o<Esc>k", { noremap = true })
map("n", "<Leader>O", "O<Esc>j", { noremap = true })

-- FZF
map("n", "<Leader>ff", ":Files<CR>", { noremap = true })
map("n", "<Leader>bb", ":Buffers<CR>", { noremap = true })
