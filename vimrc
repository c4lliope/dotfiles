let mapleader=" "

" Plugins, managed with vim-plug (https://github.com/junegunn/vim-plug)
" Run `:PlugInstall` to install or update
call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-eunuch'

" Language Support
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Development Environment
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'

" Aesthetics
Plug 'Lokaltog/vim-distinguished'
Plug 'itchyny/lightline.vim'
Plug 'blueyed/vim-diminactive'


call plug#end()
nnoremap <leader>P :PlugInstall<cr>

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
source ~/.vim/config/search.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/refactorings.vim
source ~/.vim/config/buffers.vim
source ~/.vim/config/splits.vim
source ~/.vim/config/abbreviations.vim
source ~/.vim/config/quickfix.vim

autocmd WinEnter * set winwidth=85
set winwidth=85
set winminwidth=20

runtime macros/matchit.vim
set showmatch

" Fast editing of .vimrc file
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vv :vsp $MYVIMRC<CR>
autocmd! bufwritepost .vimrc source %

" Open help in a vertical split
nnoremap <leader>h :vert help 

" Check spelling when writing plain text
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype text setlocal spell
autocmd FileType yaml setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType help setlocal nospell
autocmd Filetype text setlocal textwidth=80
autocmd FileType markdown setlocal textwidth=80
set complete+=kspell

" Fast editing of ~/tools.md file
nnoremap <Leader>t :e ~/tools.md<CR>

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

" Easily change all single quotes to double quotes in source lines
nnoremap <leader>' :%s/\v(#.*)@<!'/"/<cr>

" Create parent directories when they don't exist for a new file
function! WriteWithParentDirs()
  execute ':silent !mkdir -p %:h'
  write
  redraw!
endfunction
command! W call WriteWithParentDirs()

inoremap kj <esc>
inoremap jk <esc>

onoremap ia i)
