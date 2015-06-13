" Better searching
set ignorecase
set smartcase
set gdefault " By default, replace all instances on a line in search/replace

" Searching improvements
nnoremap <leader>/ :Ag!<space>
nnoremap / /\v
nnoremap ? :%s/\v

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
