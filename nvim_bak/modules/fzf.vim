let $FZF_DEFAULT_OPTS .= ' --inline-info'
" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '30%' }
let g:fzf_buffers_jump = 1

" command to search in src
" mac
"command! -bang SourceCodeFiles call fzf#vim#files('~/developer/src', <bang>0)
" precision
command! -bang SourceCodeFiles call fzf#vim#files('~/Developer/src', <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" keymapping
nnoremap <silent> <expr> <Leader>ff (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>fc        :Colors<CR>
nnoremap <silent> <Leader>fl        :Lines<CR>
nnoremap <silent> <expr> <Leader>fa        (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":RG <C-R><C-W><CR>"
nnoremap <silent> <Leader>fA        :RG <C-R><C-A><CR>
nnoremap <silent> <Leader>pf        :GFiles<CR>
nnoremap <silent> <Leader>fS        :SourceCodeFiles<CR>


