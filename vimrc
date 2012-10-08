" This must be first, because it changes other options as a side effect.
set nocompatible

set t_Co=16
syntax on
set background=dark
colorscheme solarized

" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-surround'
Bundle 'msanders/snipmate.vim'
Bundle 'wincent/Command-T'

filetype plugin indent on

" General Stuff
set viminfo='10,\"100,:20,%,n~/.viminfo " Pick up where we left off in a file

set encoding=utf-8
set number                      " Line numbers are good
set showcmd                     " Display incomplete commands
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changed outside vim
set pastetoggle=<F2>            " Hotkey for pasting without comments

" Whitespace
set autoindent                  " Indent automatically
set smartindent
set smarttab
set nowrap                      " Don't wrap lines
set linebreak                   "Wrap lines at convenient points
set tabstop=3
set softtabstop=3
set shiftwidth=3                " A tab is four spaces
"set expandtab                  " Use spaces, not tabs
set backspace=indent,eol,start  " Backspace through everything in insert mode

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·

" Searching
set incsearch                   " Incremental searching
set hlsearch                    " Highlight matches
set ignorecase                  " Searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Completion
set wildmode=list:longest
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing

" Scrolling
set scrolloff=8                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Disable array keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
