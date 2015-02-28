" Better searching
set ignorecase
set smartcase
set gdefault " By default, replace all instances on a line in search/replace

" Searching improvements
nnoremap <leader>/ :Ag! 
nnoremap / /\v
nnoremap ? :%s/\v
"nnoremap <leader>/ :set hlsearch!<cr>
