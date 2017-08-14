"TODO: check out other peoples vimrc
" example: ryanb/dotfiles
" example: thoughbots/dotfiles
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'python-mode/python-mode'
Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set nocompatible
inoremap kj <Esc>
" Sets how many lines of history VIM has to remember
set history=500 "Sets how many lines of history
set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
set autoindent          " auto indenting
set number              " line numbers
nnoremap <F3> :set hlsearch!<CR>
colorscheme heroku      " colorscheme desert
set nobackup            " get rid of anoying ~file
set nowritebackup
set noswapfile
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>
let @/ = ""	"clear the last used pattern
let mapleader = ","
let g:mapleader = ","
"
" " Fast saving
nmap <leader>w :w!<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set wildmenu
" Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" if has("win16") || has("win32")
"     set wildignore+=.git\*,.hg\*,.svn\*
"     else
"         set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"         endif
"
"Always show current position
set ruler
"" Height of the command bar
set cmdheight=2
"" Ctrl P map
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Alt-hjkl split navigation
nmap <silent> <A-h> :wincmd h<cr>
nmap <silent> <A-j> :wincmd j<cr>
nmap <silent> <A-k> :wincmd k<cr>
nmap <silent> <A-l> :wincmd l<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"nerdTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
:let g:airline_theme='base16'
"" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"" Tagbar settings
let g:tagbar_autofocus=0
let g:tagbar_width=42
"autocmd BufEnter *.py :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py :TagbarClose
nmap <F8> :TagbarToggle<CR>
