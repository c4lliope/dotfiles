"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.config/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Movement & Editing
call dein#add('christoomey/vim-sort-motion')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-user')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-abolish')

" File navigation
call dein#add('Shougo/denite.nvim')

" Unix integrations
call dein#add('tpope/vim-eunuch')

" tmux integration
call dein#add('blakewilliams/vim-tbro')
call dein#add('christoomey/vim-tmux-navigator')

" git integration
call dein#add('airblade/vim-gitgutter')

" language support
call dein#add('benekastah/neomake')
call dein#add('thoughtbot/vim-rspec')
call dein#add('tpope/vim-rails')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let mapleader=" "

" Specific configuration files
source ~/.config/nvim/config/buffers.vim
source ~/.config/nvim/config/movement.vim
source ~/.config/nvim/config/quickfix.vim
source ~/.config/nvim/config/refactorings.vim
source ~/.config/nvim/config/rspec.vim
source ~/.config/nvim/config/search.vim
source ~/.config/nvim/config/splits.vim
source ~/.config/nvim/config/whitespace.vim

" Open files
nnoremap <Leader>o :!open "%"<CR>

" Fast movement within a file
set relativenumber
set number

" Use 2 spaces as a tab
set expandtab
set shiftwidth=2
set tabstop=2

" Colors
set background=dark
highlight LineNr ctermbg=none
highlight CursorLineNr ctermbg=none ctermfg=yellow

" Fast editing of .vimrc file
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vv :vsp $MYVIMRC<CR>
autocmd! bufwritepost $MYVIMRC source %

" use capital U for 'redo' (ctrl-r)
nnoremap U <C-r>

" Mark long lines
set colorcolumn=81
autocmd FileType gitcommit :set colorcolumn=51

inoremap kj <esc>
inoremap jk <esc>

" Multiple cursor configuration
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap Q qqqqq

nnoremap <c-p> :<c-u>Denite file_rec<cr>

autocmd! BufWritePost * Neomake

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
