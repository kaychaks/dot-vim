let g:which_key_fallback_to_native_key=1
let g:which_key_timeout=1000

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
"nnoremap <silent> f :<c-u>WhichKey 'f'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey 'm'<CR>
