" quickly toggle the quickfix window
nnoremap <leader>c :call ToggleQuickfix()<cr>

function! ToggleQuickfix()
  call ToggleList('Quickfix List', 'c')
endfunction

function! ToggleList(bufname, prefix)
  let buffer_list = GetBufferList()

  for buffer_index in map(filter(buffer_list, 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(buffer_index) != -1
      exec(a:prefix.'close')
      return
    endif
  endfor

  let winnr = winnr()
  exec('botright ' . a:prefix . 'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! GetBufferList()
  redir => buffer_list
  silent! ls
  redir END
  return split(buffer_list, '\n')
endfunction
