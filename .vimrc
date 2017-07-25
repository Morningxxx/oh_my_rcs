syntax on
filetype plugin indent on

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

vmap # :s/^/#/g<CR>
vmap " :s/^/"/g<CR>
vmap // :s/^/\/\//g<CR>

nmap <CR> o<ESC>k
"nmap <S-CR> O<ESC>j " only work on GVim
nmap <Space><CR> O<ESC>j " only work on GVim

command RTW :%s/\s\+$//e
let g:netrw_browse_split = 4
let g:netrw_preview      = 1
let g:netrw_liststyle    = 3
let g:netrw_winsize      = 25
let g:netrw_list_hide    = '.*\.pyc' 

nmap <TAB> <C-w><C-w>
command V :Vexplore
command L :Lexplore


" these lnes setup the environment to show graphics and colors correctly.
set nocompatible
set t_co=256
colorscheme afterglow

execute pathogen#infect()
let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712,W391'

let g:minbufexplforcesyntaxenable = 1
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
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

