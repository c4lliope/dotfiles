let mapleader=" "

" Plugins, managed with vim-plug (https://github.com/junegunn/vim-plug)
" Run `:PlugInstall` to install or update
call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'christoomey/vim-sort-motion'
Plug 'embear/vim-localvimrc'
Plug 'kana/vim-textobj-indent'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'

" git integration
Plug 'tpope/vim-fugitive'

" tmux integration
Plug 'blakewilliams/vim-tbro'
Plug 'christoomey/vim-tmux-navigator'

" Language Support
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-endwise'

" Rails development
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'

" Aesthetics
Plug 'Lokaltog/vim-distinguished'

call plug#end()
nnoremap <leader>P :PlugInstall<cr>
nnoremap <leader>b :w<cr> \| :Tbro bundle install<cr>

set nocompatible
set noswapfile
set nowrap

syntax on
filetype plugin indent on

" Fast movement within a file
set relativenumber
set number

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
