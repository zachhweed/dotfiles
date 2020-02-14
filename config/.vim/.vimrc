if empty(glob('~/.vim/autload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=","

let @b = "Obinding.pry\e"

call plug#begin('~/.vim/plugged')
  Plug 'google/vim-maktaba'
  Plug 'airblade/vim-gitgutter'
  Plug 'mileszs/ack.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'szw/vim-tags'
  Plug 'chase/focuspoint-vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ajmwagar/vim-deus'
  Plug 'junegunn/fzf'
  Plug 'rking/ag.vim'
call plug#end()

filetype plugin indent on
set t_Co=256
set termguicolors
set wildmode=full
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
syntax enable
colorscheme monokai

set shell=/bin/bash
set swapfile
set dir=~/tmp
set backspace=indent,eol,start
set tabstop=2 expandtab shiftwidth=2
set number
set showmatch
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.log
set autochdir
set exrc
set secure
set splitbelow
set splitright
set mouse=a

set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~20%' }

let g:tmux_navigator_no_mappings = 1

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

fun! SplitWorkspaceFromCurrent()
  let components = ["controller", "model"]

  for component in components
    execute 'S' . component
  endfor
  :vs db/schema.rb
endfun

map <space> V

map <leader>a <C-W><C-H>
map <leader>s <C-W><C-J>
map <leader>d <C-W><C-K>
map <leader>f <C-W><C-L>

nnoremap <silent> <leader>a :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>s :TmuxNavigateDown<cr>
nnoremap <silent> <leader>d :TmuxNavigateUp<cr>
nnoremap <silent> <leader>f :TmuxNavigateRight<cr>

nnoremap <leader>fa :Ack
nnoremap <leader>cdev :cd ~/Development<CR>
nnoremap <leader>v :Vex<CR>
nnoremap <C-P> :FZF<CR>
nnoremap <leader>S :call SplitWorkspaceFromCurrent()<CR>

nnoremap <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd StdinReadPre * let s:std_in=1
