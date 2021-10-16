let g:dashboard_default_executive ='fzf'
let g:dashboard_fzf_float=0
let g:dashboard_fzf_window=0
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
"nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
"nnoremap <silent> <Leader>fa :DashboardFindWord <C-R><C-W><CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>dn :DashboardNewFile<CR>
