set synmaxcol=1000

" setting true colors
set t_Co=256
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set diffopt=filler,vertical
set autoread
set foldlevelstart=99

" edit the config file
nnoremap <silent> <leader>hc :e $MYVIMRC<CR>
" source the updated config
nnoremap <silent> <leader>hr :w!<CR>:source $MYVIMRC<CR>

" ==========BUFFERS==========
" map bb to show buffers
noremap <silent> <leader>bb :ls<CR>:Buffers<CR>
" map bB to show hidden buffers
nnoremap <silent> <leader>bB :ls!<CR>:buffer<Space>
" buffer movements
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>b[ :bp<CR>
nnoremap <silent> <leader>b] :bn<CR>
nnoremap <silent> <leader>bn :bn<CR>
" buffer delete
"nnoremap <silent> <leader>bd :bd<CR>
"nnoremap <silent> <leader>bD :bd!<CR>
" new buffer
nnoremap <silent> <leader>bc :vnew<CR>
nnoremap <silent> <leader>bC :new<CR>

" kill buffer
nnoremap <silent> <leader>bd :bp\|bd #<CR>
nnoremap <silent> <leader>bD :%bd\|e#\|bd#<CR>

" ==========BUFFERS==========

" ==========WINDOWS==========
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wm :only<CR>

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

nnoremap <silent> <leader>wd :bd<CR>
nnoremap <silent> <leader>wv :vsplit<CR>
nnoremap <silent> <leader>ws :split<CR>
" ==========WINDOWS==========

" Clear highlights
"nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

nnoremap <leader>s :update<cr>

" jk | Escaping!
inoremap jk <Esc>
"xnoremap jk <Esc>
cnoremap jk <C-c>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Make Y behave like other capitals
nnoremap Y y$

" quit vi
inoremap <C-Q>     <esc>:q<cr>
nnoremap <Leader>q :q<cr>
nnoremap <silent> <leader>qq :qa!<CR>

" Zoom a buffer in a split window setup to a different tab
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" moving lines
nnoremap <silent> <a-k> :move-2<cr>
nnoremap <silent> <a-j> :move+<cr>
nnoremap <silent> <a-h> <<
nnoremap <silent> <a-l> >>
xnoremap <silent> <a-k> :move-2<cr>gv
xnoremap <silent> <a-j> :move'>+<cr>gv
xnoremap <silent> <a-h> <gv
xnoremap <silent> <a-l> >gv
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>
