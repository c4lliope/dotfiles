let mapleader=" "

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/grayson/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/grayson/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Core Functionality
NeoBundle 'christoomey/vim-sort-motion'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'skwp/greplace.vim'

" git integration
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" tmux integration
NeoBundle 'blakewilliams/vim-tbro'
NeoBundle 'christoomey/vim-tmux-navigator'

" Language Support
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-endwise'

" Rails development
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-rails'

" Aesthetics
NeoBundle 'Lokaltog/vim-distinguished'

" Experimental
" NeoBundle 'christoomey/vim-quicklink'
" NeoBundle 'tpope/vim-commentary'
" NeoBundle 'tpope/vim-projectionist'
" NeoBundle 'zaiste/tmux.vim'
NeoBundle 'christoomey/vim-rfactory'
NeoBundle 'slim-template/vim-slim'
" NeoBundle 'stefanoverna/vim-i18n'
NeoBundle 'benekastah/neomake'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


nnoremap <leader>b :w<cr> \| :Tbro bundle install<cr>

set nocompatible
set noswapfile
set nowrap

syntax on
filetype plugin indent on

" Fast movement within a file
set relativenumber
set number
runtime macros/matchit.vim

" Use 2 spaces as a tab
set expandtab
set tabstop=2
set shiftwidth=2

" Colors
colorscheme distinguished
set background=dark
highlight LineNr ctermbg=none
highlight CursorLineNr ctermbg=none ctermfg=yellow

" Additional configurations and mappings
source ~/.vim/config/abbreviations.vim
source ~/.vim/config/buffers.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/git.vim
source ~/.vim/config/quickfix.vim
source ~/.vim/config/refactorings.vim
source ~/.vim/config/rspec.vim
source ~/.vim/config/search.vim
source ~/.vim/config/spacing.vim
source ~/.vim/config/splits.vim
source ~/.vim/config/tmux.vim
source ~/.vim/config/whitespace.vim

let g:localvimrc_persistent=1

runtime macros/matchit.vim
set showmatch

" Fast editing of .vimrc file
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vv :vsp $MYVIMRC<CR>
autocmd! bufwritepost .vimrc source %

" Open help in a vertical split
nnoremap <leader>h :vert help<space>

" Check spelling when writing plain text
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype text setlocal spell
autocmd FileType yaml setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType help setlocal nospell
autocmd Filetype text setlocal textwidth=80
autocmd FileType markdown setlocal textwidth=80
set complete+=kspell

" Run C++ files
nnoremap <Leader>m :w \| :!g++ --std=c++11 % && ./a.out<CR>

" Open files
nnoremap <Leader>o :!open "%"<CR>

" use capital U for 'redo' (ctrl-r)
nnoremap U <C-r>

" Mark long lines
set colorcolumn=81
autocmd FileType gitcommit :set colorcolumn=51

" Quickly toggle paste mode
nnoremap <Leader>p :set invpaste paste?<CR>

" Shortcuts for scanning through results list
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

" Easily change all single quotes to double quotes in source lines
nnoremap <leader>' :%s/\v(#.*)@<!'/"/<cr>

" Create parent directories when they don't exist for a new file
function! WriteWithParentDirs()
  :Mkdir
  :write
endfunction
command! W call WriteWithParentDirs()

inoremap kj <esc>
inoremap jk <esc>

onoremap ia i)

nnoremap <leader>r :redraw!<cr>
nnoremap Q qqqqq

"Experimental
" set autowrite
autocmd BufEnter Gemfile nnoremap <buffer> gf :!open https://rubygems.org/gems/<c-r><c-w><cr>
vnoremap <leader>ri :call I18nTranslateString()<cr>
autocmd! BufWritePost * Neomake
if has('nvim')
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif
