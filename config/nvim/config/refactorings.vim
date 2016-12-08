" Refactorings

" Extract a variable from visual mode (ruby)
" After extracting (to a variable called "variable"),
" the script leaves you in the middle of a substitution command
" to rename the variable to whatever you want.
vnoremap <leader>re cvariable<esc>O<esc>p==Ivariable = <esc>:.,+1s/variable/
