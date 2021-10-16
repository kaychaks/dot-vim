" not required for neovim but still...
set nocompatible

" no bells and whistles
set vb t_vb=

" unload buffers when hidden
set hidden

" show line number
set number

" autosave everything
set autowriteall

" auto complete support
set wildmenu wildmode=full

filetype plugin indent on

" syntax highlight
syntax on

" enable mouse in all modes
set mouse=a

" scroll a bit horizontally when at the end of the line
set sidescroll=6

set textwidth=80
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline

set acd

set clipboard+=unnamedplus

let g:auto_save = 1

set ignorecase
set smartcase

set lazyredraw
set timeoutlen=500
set backspace=indent,eol,start
set whichwrap=b,s
set shortmess=aIT
set grepformat=%f:%l:%c:%m,%f:%l:%m

noremap <leader><leader> :

map gf :e <cfile><CR>

noremap <C-F> <C-D>
noremap <C-B> <C-U>
