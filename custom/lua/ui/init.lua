-- settings related to user interface improvements

vim.scriptencoding = "utf-8"

vim.go.autoindent = true
vim.go.timeoutlen = 500
vim.go.encoding = "utf-8"
vim.go.fileencoding = "utf-8"
vim.go.scrolloff = 10
vim.go.showmode = false
vim.go.number = true
vim.wo.number = true
vim.go.hidden = true
vim.go.wrap = false
vim.go.joinspaces = false
vim.go.signcolumn = "yes"
vim.wo.signcolumn = "yes"
vim.cmd("colorscheme base16-atelier-dune")
vim.g.base16colorspace = 256
vim.go.t_Co = 256
vim.go.termguicolors = true
vim.go.background = "dark"
vim.go.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

vim.go.title = true
vim.go.hlsearch = true

-- completion menu
vim.go.wildmenu = true
vim.go.wildmode = "list:longest"
-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L310
vim.go.wildignore =
	".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"

--tabs
vim.go.shiftwidth = 2
vim.go.softtabstop = 2
vim.go.tabstop = 2
vim.go.expandtab = false

vim.go.foldenable = false
vim.go.synmaxcol = 500
vim.go.laststatus = 2
vim.go.colorcolumn = 80
vim.go.showcmd = true
vim.go.cmdheight = 1
vim.go.mouse = "a"

vim.go.inccommand = "split"
vim.go.syntax = true

-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L318
vim.go.formatoptions = "tc" .. "r" .. "q" .. "n" .. "b"

vim.go.splitright = true
vim.go.splitbelow = true

vim.go.undofile = true

vim.go.incsearch = true
vim.go.ignorecase = true
vim.go.smartcase = true

-- auto save
vim.go.autowriteall = true

-- shell
vim.go.shell = 'fish'

-- smart indent
vim.go.breakindent = true

-- go down to subfolders when finding files
vim.go.path = '**'

-- highlights
vim.go.cursorline = true
vim.go.winblend = 0
vim.go.wildoptions = "pum"
vim.go.pumblend = 5

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
 augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

-- copy text to gloal clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- Add asterisks in block comments
vim.opt.formatoptions:append('r')
