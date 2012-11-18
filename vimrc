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
" Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
" Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'honza/snipmate-snippets'
Bundle 'brookhong/DBGPavim'

filetype plugin indent on

" General Stuff
set encoding=utf-8
set number                      " Line numbers are good
set showcmd                     " Display incomplete commands
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changed outside vim
set pastetoggle=<F2>            " Hotkey for pasting without comments

" Configure viminfo 
set viminfo='10,\"100,:20,%,n~/.viminfo

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

" Neocomplcache options
"let g:acp_enableAtStartup = 0
"let g:neocomplcache_enable_at_startup = 0
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_patter = '\*ku\*'
"if !exists('g:neocomplcache_keyword_patterns')
	"let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"imap <C-k>	<Plug>(neocomplcache_snippets_expand)
"smap <C-k>	<Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-l>	neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Syntastic Options

" Ctrl P Options 
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1 
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

" SVN Blame

vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Disable array keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
