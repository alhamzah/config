" Vundle setup, has to be on top

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<Tab>"

Plugin 'vim-python/python-syntax'
syntax enable
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
let g:python_highlight_all = 1

Plugin 'ervandew/supertab'
Plugin 'tmhedberg/SimpylFold'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'

Plugin 'mhinz/vim-signify'
" default updatetime 4000ms is not good for async update
set updatetime=100

autocmd User SignifyHunk call s:show_current_hunk()

function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25
autocmd FileType netrw setl bufhidden=delete

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set timeoutlen=1000 ttimeoutlen=0

set path+=/shared/home/alhamzah/code/python/**

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
set scrolloff=5

set wildmenu
set wildmode=longest:full,full

set encoding=utf-8  " The displayed encoding
set fileencoding=utf-8  " The encoding written to file.

set clipboard=unnamed

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Folding
nnoremap <space> za
vnoremap <space> zf

" Fuzzy find with fzf
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Ag<Cr>

vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

set directory^=$HOME/.vim/tmp//
