" fuGITive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gcommit -m "WIP"<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gr :Git rebase -i master<CR>

"" GitGutter
" Ignore whitespace changes
" Use a more effective diffing algorithm
let g:gitgutter_diff_args = '-w --patience'
