nmap <leader>gg :G<CR>
nmap <leader>g<space> :G 
nmap <leader>gb :G checkout  
nmap <leader>gB :G blame<CR>   
nmap <leader>gC :G clone 
nmap <leader>gF :G fetch<CR> 
nmap <leader>gS :Gwrite :0:%<CR> 
nmap <leader>gY :redir @* \| :! git config --get remote.origin.url<CR>:redir END<CR><CR>

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()
