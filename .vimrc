
autocmd bufwritepost $myvimrc source $myvimrc
colorscheme diokai 

filetype indent plugin on

syntax on
filetype plugin indent on

execute pathogen#infect()
set backspace=indent,eol,start

set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
set modeline
"autocmd filetype python setlocal foldmethod=indent

set hlsearch
set incsearch
set ignorecase

set nu
set cursorline
"set cursorcolumn

set wildmenu
set mouse=a
set clipboard=unnamed

command RTW :%s/\s\+$//e
let g:netrw_browse_split=4
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 15

nnoremap <TAB> gt


set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" these lnes setup the environment to show graphics and colors correctly.
set nocompatible
set t_co=256

let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712,W391'

let g:minbufexplforcesyntaxenable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
   set ttimeoutlen=10
   augroup fastescape
      autocmd!
      au insertenter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

