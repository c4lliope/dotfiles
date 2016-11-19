" RSpec.vim mappings
let g:rspec_command = "w \| :Tbro time ./bin/test {spec}"
" let g:rspec_command = "w \| :Tbro dcrun web rake db:seed"
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ss :call RunNearestSpec()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>
nnoremap <Leader>sr :w \| :Tbro time rake<CR>
nnoremap <Leader>sg :w \| :Tbro time rspec && git add -p<CR>

nnoremap <leader>sc :w \| :Tbro time bundle exec rubocop<cr>
