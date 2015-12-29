" Quickly open/save/close buffers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>j :bn<CR>
nnoremap <Leader>k :bp<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :edit %%

" Allow buffers to be backgrounded even if they have unsaved changes
set hidden

" Jump to the previous open buffer
nnoremap <Leader><Leader> <C-^>
