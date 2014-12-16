" Plugins, managed with vim-plug (https://github.com/junegunn/vim-plug)
" Run `:PlugInstall` to install or update
call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-sensible'

" Language Support
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-endwise'

" Development Environment
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'

" Aesthetics
Plug 'Lokaltog/vim-distinguished'
Plug 'itchyny/lightline.vim'
Plug 'blueyed/vim-diminactive'

Plug 'kien/ctrlp.vim'

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()

set nocompatible

source ~/.vim/config/ctrlp.vim
source ~/.vim/config/refactorings.vim
source ~/.vim/config/text_expansion.vim

set noswapfile

" Better searching
set ignorecase
set smartcase
set gdefault " By default, replace all instances on a line in search/replace

runtime macros/matchit.vim
set showmatch

let mapleader=" "

syntax on
filetype plugin indent on

colorscheme distinguished
set background=dark
highlight LineNr ctermbg=none
highlight CursorLineNr ctermbg=none ctermfg=yellow

" Fast editing of .vimrc file
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vv :vsp $MYVIMRC<CR>
autocmd! bufwritepost .vimrc source %

" Open help in a vertical split
nnoremap <leader>h :vert help 

" Automatic reloading of Phoenix configuration
autocmd! bufwritepost .phoenix.js !killall "Phoenix"; open -a Phoenix

" Check spelling when writing plain text
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.mkd setlocal spell
autocmd BufNewFile,BufRead *.mkd setlocal textwidth=80
autocmd BufNewFile,BufRead *.txt setlocal spell
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
autocmd BufNewFile,BufRead *.yml setlocal spell
set complete+=kspell

" Fast editing of ~/tools.md file
nnoremap <Leader>t :e ~/tools.md<CR>

" Fast movement within a file
set relativenumber
set number

" Use 2 spaces as a tab
set expandtab
set tabstop=2
set shiftwidth=2

" Quickly open/save/close buffers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>j :bn<CR>
nnoremap <Leader>k :bp<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :edit %%

" Open split windows
set splitbelow
set splitright
noremap <C-Down> :sp<CR>
noremap <C-Up> :sp<CR><C-W><C-K>
noremap <C-Right> :vsp<CR>
noremap <C-Left> :vsp<CR><C-W><C-H>

" Navigate split windows
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Allow buffers to be backgrounded
" even if they have unsaved changes
set hidden

" RSpec.vim mappings
let g:rspec_command = "w \| !clear && time rspec -- {spec}"
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ss :call RunNearestSpec()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>
nnoremap <Leader>sr :w<CR> \| :!bundle exec rake<CR>

" Run C++ files
nnoremap <Leader>m :w \| :!g++ --std=c++11 % && ./a.out<CR>

" Open files
nnoremap <Leader>o :!open "%"<CR>

nnoremap <Leader><Leader> <C-^>

" use capital U for 'redo' (ctrl-r)
nnoremap U <C-r>

" Mark long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufNewFile,BufRead *.log highlight OverLength ctermbg=none ctermfg=none guibg=none
nnoremap <Leader>l :highlight OverLength ctermbg=none ctermfg=none guibg=none<CR>
match OverLength /\%81v.\+/

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Quickly toggle paste mode
nnoremap <Leader>p :set invpaste paste?<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Shortcuts for scanning through results list
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

" fuGITive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gcommit -m "WIP"<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gr :Git rebase -i master<CR>

" Create parent directories when they don't exist for a new file
function! WriteWithParentDirs()
  execute ':silent !mkdir -p %:h'
  write
endfunction
command! W call WriteWithParentDirs()

inoremap kj <esc>
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap kj <esc>
vnoremap jk <esc>
vnoremap <esc> <nop>

"" Abbreviations
iabbrev gh https://github.com
iabbrev gw graysonwright
iabbrev -- –

" Ruby abbreviationss
iabbrev init initialize

" quickly toggle the quickfix window
nnoremap <leader>c :call ToggleList('Quickfix List', 'c')<cr>

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return split(buflist)
endfunction

function! ToggleList(bufname, prefix)
  let buflist = GetBufferList()
  for bufnum in map(filter(buflist, 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:prefix.'close')
      return
    endif
  endfor
  if a:prefix == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo 'Location List is Empty.'
      return
  endif
  let winnr = winnr()
  exec('botright ' . a:prefix . 'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
