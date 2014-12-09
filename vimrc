set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtimeath to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Plugins, managed with vundle
" Run `:BundleInstall` to install or update
Bundle 'tpope/vim-sensible'
Bundle 'plasticboy/vim-markdown'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'thoughtbot/vim-rspec'
Bundle 'scrooloose/syntastic'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'itchyny/lightline.vim'
Bundle 'rking/ag.vim'
Bundle 'skwp/greplace.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Colorschemes
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'

source ~/.vim/config/ctrlp.vim
source ~/.vim/config/refactorings.vim
source ~/.vim/config/text_expansion.vim

set noswapfile

runtime macros/matchit.vim

let mapleader=" "

syntax on
filetype plugin indent on

colorscheme base16-default
set background=dark
highlight LineNr ctermbg=none
highlight CursorLineNr ctermbg=none ctermfg=yellow

" Fast editing of .vimrc file
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>vv :vsp $MYVIMRC<CR>
autocmd! bufwritepost .vimrc source %

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

" Better searching
set ignorecase
set smartcase

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
