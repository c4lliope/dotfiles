set splitbelow
set splitright

autocmd WinEnter * set winwidth=85
set winwidth=85
set winminwidth=20

autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
