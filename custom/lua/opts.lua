-- options to be set globally and for some plugin

-- global options
vim.go.autoindent = true
vim.go.timeoutlen = 300
vim.go.encoding = "utf-8"
vim.go.scrolloff = 2
vim.go.showmode = false
vim.go.hidden = true
vim.go.wrap = false
vim.go.joinspaces = false
vim.go.signcolumn = "yes"

vim.go.splitright = true
vim.go.splitbelow = true

vim.go.undofile = true

vim.go.wildmenu = true
vim.go.wildmode = "list:longest"
-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L310
vim.go.wildignore=".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"

vim.go.shiftwidth = 2
vim.go.softtabstop = 2
vim.go.tabstop = 2
vim.go.expandtab = false

-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L318
vim.go.formatoptions = "tc" .. "r" .. "q" .. "n" .. "b"

vim.go.incsearch = true
vim.go.ignorecase = true
vim.go.smartcase = true

vim.go.foldenable = false
vim.go.synmaxcol = 500
vim.go.laststatus = 2
vim.go.number = true
vim.go.colorcolumn = 80
vim.go.showcmd = true
vim.go.mouse = "a"

vim.go.guicursor="n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
vim.go.inccommand = "nosplit"
vim.go.t_Co = 256
vim.go.termguicolors = true
vim.go.background = "dark"
vim.go.syntax = true
