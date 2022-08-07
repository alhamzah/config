colorscheme molokai 

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

noremap <space> :

set timeoutlen=1000 ttimeoutlen=0

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25


set backspace=2
set number
set nocompatible
set hlsearch
set incsearch
set autoindent
set ruler
set ls=2
set confirm
set mouse=a
set cmdheight=2

set expandtab           " enter spaces when tab is pressed
set textwidth=0       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set foldmethod=syntax
set scrolloff=5

set wildmenu
set wildmode=longest:full,full

set encoding=utf-8  " The displayed encoding
set fileencoding=utf-8  " The encoding written to file.

let python_highlight_all=1
syntax enable

set clipboard=unnamed


" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

set directory^=$HOME/.vim/tmp//
