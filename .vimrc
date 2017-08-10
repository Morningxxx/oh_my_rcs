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
set rnu
set cursorline
"set cursorcolumn

autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

set updatetime=500

set wildmenu
set mouse=a
set ruler
set clipboard=unnamed
 
:set matchpairs=[:],{:},<:>,(:)

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python              let b:comment_leader = '# '
autocmd FileType conf,fstab                  let b:comment_leader = '# '
autocmd FileType tex                         let b:comment_leader = '% '
autocmd FileType mail                        let b:comment_leader = '> '
autocmd FileType vim                         let b:comment_leader = '" '

function CommentLine(mode)
    let a:pattern = escape(b:comment_leader, '\/')
    if a:mode == 'v'
       "  try
       "      execute "silent '<,'>s/^\v(\s*)\V".a:pattern."/\1/g"
       "  catch
       "      execute "silent '<,'>s/^\(\s*\)/\1".a:pattern."/g"
       "  endtry
        try
            execute "silent '<,'>s/^".a:pattern."//g"
        catch
            execute "silent '<,'>s/^/".a:pattern."/g"
        endtry
    elseif a:mode == 'n'
        try
            execute 'silent s/^\v(\s*)\V'.a:pattern.'/\1/g'
        catch
            execute 'silent s/^\v(\s*)/\1'.a:pattern.'/g'
        endtry
    endif
    nohlsearch
endfunction

imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>
imap < <><Left>
imap ' <C-v>'<C-v>'<Left>
imap " <C-v>"<C-v>"<Left>

nmap <silent> <C-_> :<C-w>call CommentLine('n')<CR>
vmap <silent> <C-_> :<C-w>call CommentLine('v')<CR>
" nmap <silent> // :<C-w>call CommentLine('n')<CR>
" vmap <silent> // :<C-w>call CommentLine('v')<CR>
" noremap <silent> // :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> <C-_> :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

nmap <CR> o<ESC>
nmap <Space><CR> O<ESC>
"nmap <S-CR> O<ESC> " only work on GVim

command RTW :%s/\s\+$//e
command Q :on | q
command R :w | e!

nmap N Nzz
nmap n nzz
nmap g; g;zz
nmap g, g,zz
nmap # #zz
nmap * *zz

let g:netrw_browse_split = 4
let g:netrw_preview      = 1
let g:netrw_liststyle    = 3
let g:netrw_winsize      = 25
let g:netrw_list_hide    = '.*\.pyc' 

nmap <TAB> <C-w><C-w>

" these lnes setup the environment to show graphics and colors correctly.
set nocompatible
set t_co=256
colorscheme afterglow

execute pathogen#infect()

command L :NERDTreeToggle
command V :NERDTreeToggle
command GT :GitGutterToggle

let NERDTreeIgnore = ['.pyc$', '.swo$', '.swp$']

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

