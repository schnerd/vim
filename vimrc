" This must be first, because it changes other options as a side effect.
set nocompatible

" Terminal colors
set t_Co=16
syntax on
set background=dark
colorscheme solarized

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
"Bundle 'Shougo/neosnippet'
"Bundle 'honza/snipmate-snippets'
"Bundle 'brookhong/DBGPavim'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'vim-scripts/AutoComplPop'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'joonty/vdebug'

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

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" change the mapleader from \ to ,
let mapleader=","

"Open definition in a new vertical split window
map <Leader>d :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
set tabstop=4
set softtabstop=4
set shiftwidth=4                " A tab is four spaces
set ts=4 sw=4 ai
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
set wildignore=*.o,*.obj,*.scssc,*~     " Stuff to ignore when tab completing

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

" Syntastic, just use base php checker
let g:syntastic_php_checkers=['php', 'phpcs']

" Ctrl P Options 
" Install via http://ctrlpvim.github.io/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1 
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

" Powerline Options
let g:Powerline_symbols = 'fancy'

" vDebug Options
let g:vdebug_options= {
\    "timeout" : 30,
\    "break_on_open" : 0,
\    "watch_window_style" : 'compact',
\}

" Open ControlP on startup
function! StartUp()
	if 0 == argc()
		CtrlP
	end
endfunction

autocmd VimEnter * call StartUp()

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

" Fix syntax highlighting
map <leader>fs :syn sync fromstart<cr>

" Search and replace current word
nnoremap <leader>r :%s/<c-r>=expand('<cword>')<cr>/

" Remap the visual line movement shortcut that always drops me into shell
nnoremap VK Vk
nnoremap VJ Vj

vnoremap <leader>ct cvar t1 = (new Date()).getTime();<esc>o<esc>gPkA<esc>oconsole.log(((new Date()).getTime()-t1)+'ms');<esc>

" Make substitution repeat use the previous flags as well
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Generate ctags for the current project
nnoremap <f5> :!ctags -R<CR>

" Make grep use ack
set grepprg=ack-grep\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p 

" Syntax highlighting for HTML in PHP strings
let php_htmlInStrings=1

" make arrow keys do something useful
map <Up> <C-W>+
map <Down> <C-W>-
map <Left> <C-W><
map <Right> <C-W>>

" Quick sessions
map <leader>ss :mksession! ~/.vim/mysession.vim<CR>
map <leader>os :source ~/.vim/mysession.vim<CR>
