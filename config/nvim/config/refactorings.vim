" Refactorings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
  " Copy the variable under the cursor into the 'a' register
  :let l:tmp_a = @a
  :normal "ayiw
  " Delete variable and equals sign
  :normal 2daW
  " Delete the expression into the 'b' register
  :let l:tmp_b = @b
  :normal "bd$
  " Delete the remnants of the line
  :normal dd
  " Go to the end of the previous line so we can start our search for the
  " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
  " work; I'm not sure why.
  normal k$
  " Find the next occurence of the variable
  exec '/\<' . @a . '\>'
  " Replace that occurence with the text we yanked
  exec ':.s/\<' . @a . '\>/' . @b
  :let @a = l:tmp_a
  :let @b = l:tmp_b
endfunction

nnoremap <leader>ri :call InlineVariable()<cr>

" Extract a variable from visual mode (ruby)
" After extracting (to a variable called "variable"),
" the script leaves you in the middle of a substitution command
" to rename the variable to whatever you want.
vnoremap <leader>re cvariable<esc>O<esc>p==Ivariable = <esc>:.,+1s/variable/

" Transform an argument list or hash from a single line into multiple lines,
" breaking on commas.
" See http://superuser.com/questions/652878/653027#653027
nnoremap <leader>ra $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/<CR>A,<Esc>j=%

" Reverse: transform an argument list or hash from multiple lines into a
" single line.
nnoremap <leader>rb Vi)A<bs><esc>Vi):s/,\n \+/, <cr>kJxJ
nnoremap <leader>rc Vi}A<bs><esc>Vi}:s/,\n \+/, <cr>kJxJ
