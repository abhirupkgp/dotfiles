set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
call vundle#end()            " required
filetype plugin indent on    " required
inoremap kj <Esc>
set autoindent
set number
set history=500
set so=7
let mapleader=" "
nmap <leader>w :w!<cr>
set autoread " set to auto read when a file is changed from outside

" Python specific configs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set ignorecase
set hlsearch
set incsearch
set showmatch

" colorscheme desert

set nobackup
set noswapfile
set nowb

let g:SuperTabDefaultCompletionType = "<c-n>"
