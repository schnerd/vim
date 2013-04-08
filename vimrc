" This must be first, because it changes other options as a side effect.
set nocompatible

" Terminal colors
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
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/neosnippet'
Bundle 'honza/snipmate-snippets'
Bundle 'brookhong/DBGPavim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/AutoComplPop'

filetype plugin indent on

" General Stuff
set encoding=utf-8
set number                      " Line numbers are good
set showcmd                     " Display incomplete commands
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changed outside vim
set pastetoggle=<F2>            " Hotkey for pasting without comments

" Tags
set tags=~/.vim/mytags

" change the mapleader from \ to ,
let mapleader=","

"Open definition in a new vertical split window
map <Leader>d :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" JS Beautify
map <Leader>f :call JsBeautify()<cr>

" Configure viminfo 
set viminfo='10,\"100,:20,%,n~/.viminfo

" Force sudo write
cmap w!! %!sudo tee > /dev/null %

" Substite visual selection with register text
vmap r "_dp
vmap R "_dP

" Shortcut to paste from yank register
nmap <Leader>p "0p
nmap <Leader>P "0p

" PHP Docs and automatically write * when doing a newline in a doc block
nmap <Leader>j :call PhpDoc()<cr>
autocmd FileType php setlocal comments=sl:/*,mb:*,elx:*/
set formatoptions+=r

" Better indentation for html/css/js in PHP files
autocmd FileType php setlocal indentkeys-=*<Return>

" Whitespace
set autoindent                  " Indent automatically
set smartindent
set smarttab
set nowrap                      " Don't wrap lines
set linebreak                   "Wrap lines at convenient points
set tabstop=3
set softtabstop=3
set shiftwidth=3                " A tab is four spaces
set ts=3 sw=3 ai
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
set scrolloff=15                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Tabular
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

" Ctrl P Options 
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1 
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

" Powerline Options
let g:Powerline_symbols = 'fancy'

" xDebug dont break on first entry
let g:dbgPavimBreakAtEntry = 0

" Remap space to change windows
:map <Space> <C-W>w

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Re-map write/quit keys
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>aw :wall<cr>
map <leader>aq :qall<cr>

" Search and replace current word
nnoremap <leader>r :%s/<c-r>=expand('<cword>')<cr>/

" Remap the visual line movement shortcut that always drops me into shell
nnoremap VK Vk
nnoremap VJ Vj

" Retain visual selection when indenting blocks
vnoremap < <gv
vnoremap > >gv

" Make substitution repeat use the previous flags as well
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Generate ctags for the current project
nnoremap <f5> :!ctags -R<CR>

" Make grep use ack
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
