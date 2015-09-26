function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre *.css,*.erb,*.haml,*.hs,*.js,*.jsx,*.md,*.py,*.rb,*.scss,*.slim*.vim,Gemfile :call <SID>StripTrailingWhitespaces()

" Display extra whitespace
set list listchars=tab:»·,trail:·
