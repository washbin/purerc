""" Break compatibility with vi
set nocompatible

set encoding=utf-8

let mapleader='\'
nnoremap <leader>\ `` " go to previous cursor position

""" Syntax and plugin
filetype on
filetype plugin on
filetype indent on
syntax enable

""" Finding files
set path+=**
set wildignore+=**/.venv/**
set wildignore+=**/node_modules/**
set wildmenu
set wildmode=list:longest

set number			" show line number
" set relativenumber		" show number's realtive to current line
set cursorline			" line with cursor is highlited
set mouse=a			" Enable mouse use
set clipboard+=unnamedplus	" Same clipboard for vim and system

" set nowrap
set incsearch
set ignorecase			" ignore case while searching
set smartcase			" no ignore in capital letters
set showmatch
set hlsearch			" higlight search
set history=1000		" commands to save in history default is 20.
nnoremap <leader>h :nohl<CR>	" clear seach higlights

set showcmd " show command typed in last line
set showmode


""" Enable folding
set foldmethod=indent
set foldlevel=99

""" Folding with spacebar
nnoremap <space> za

""" ii for escape
inoremap ii <Esc>

""" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Resize split windows
nnoremap <C-up> <C-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

""" Moving lines up and down with alt j k in normal and visual
nnoremap <silent> <A-k> :m .-2<CR>==
nnoremap <silent> <A-j> :m .+1<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

""" python PEP8 guide
au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ shiftround
	\ autoindent
	\ fileformat=unix

""" higlighting requirements.txt files as python
autocmd BufNewFile,BufRead requirements*.txt set ft=python

""" HTML,CSS,JS indentation guide
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

""" Highlight improper use of whitespace
highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" Splittling behaviour alter
set splitright
set splitbelow

""" Netrw with settings and Ctrl n for toggling
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_list_hide=netrw_gitignore#Hide()
nnoremap <silent> <C-n> :Lexplore!<CR>

""" Integrated terminal opens in insert mode and mapped to Ctrl t
function! OpenTerminal()
	:terminal
	set nonumber
	set nocursorline
	resize 15
endfunction
nnoremap <silent> <C-t> :call OpenTerminal()<CR>

""" Enable marking fold in vim files
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

""" Enable undofile if vim > 7.3
if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

""" Set cursoline only in active window
augroup cursor_off
	autocmd!
	autocmd WinLeave * set nocursorline
	autocmd WinEnter * set cursorline
augroup END

""" Status line
set laststatus=2
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

""" Prevent creation of swap files
" set nobackup
" set nowritebackup
" set noswapfile

""" Visualising tabs
" set list lcs=tab:\|\

""" current colorscheme follows terminal background
" hi Normal ctermbg=NONE guibg=NONE
