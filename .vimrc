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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'

Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<S-Tab>"

Plugin 'vim-python/python-syntax'
syntax enable
syntax on
let g:rehash256 = 1
colorscheme molokai
let g:molokai_original = 1
let g:python_highlight_all = 1
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" ripgrep not included in image
function! GrepFzf(query, fullscreen, grepcase)
  let command_fmt = 'grep --color=always -nr' . a:grepcase . ' %s --exclude=\*.{pyc,csv,log\*} --exclude-dir=\.\* || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Grep call GrepFzf(<q-args>, <bang>0, '')
command! -nargs=* -bang Grepi call GrepFzf(<q-args>, <bang>0, 'i')
set grepprg=grep\ -r\ --exclude=\*.{pyc,csv,log\*}\ --exclude-dir=\.\*

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='cool'

Plugin 'mhinz/vim-signify'
" default updatetime 4000ms is not good for async update
set updatetime=100

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

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

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
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Grepi<Cr>

vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

set directory^=$HOME/.vim/tmp//
