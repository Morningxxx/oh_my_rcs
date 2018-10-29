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
set smartcase
set nu
set rnu
set cursorline
"set cursorcolumn

autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

set updatetime=6000

set wildmenu
set mouse=a
set ruler
set clipboard=unnamed

set matchpairs=[:],{:},<:>,(:),':',":"

set path+=getcwd().'/**/*'

let g:netrw_browse_split = 4
let g:netrw_preview      = 1
let g:netrw_liststyle    = 3
let g:netrw_winsize      = 25
let g:netrw_list_hide    = '.*\.pyc' 

" these lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_co=256
colorscheme molokai

" custom key mapping
" comment lines
" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python              let b:comment_leader = '# '
autocmd FileType conf,fstab                  let b:comment_leader = '# '
autocmd FileType tex                         let b:comment_leader = '% '
autocmd FileType mail                        let b:comment_leader = '> '
autocmd FileType vim                         let b:comment_leader = '" '

" comment action
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

" comment mapping
nmap <silent> <C-_> :<C-w>call CommentLine('n')<CR>
vmap <silent> <C-_> :<C-w>call CommentLine('v')<CR>

" User TAB to complete in insert mode
imap <TAB> <C-N>
" use tab to switch among windows in normal mode
nmap <TAB> <C-w><C-w>

" auto pair operator
imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>
imap < <><Left>
imap ' <C-v>'<C-v>'<Left>
imap " <C-v>"<C-v>"<Left>
autocmd FileType vim iu "

" insert blank line
nmap <CR> o<ESC>
nmap <Space><CR> O<ESC>
" nmap <S-CR> O<ESC> " only work on GVim

" add custom operator mapping
onoremap <silent> ie :<C-U>normal! ggVG<CR>
onoremap <silent> ae :<C-U>normal! ggVG<CR>

onoremap <silent> i_ :<C-U>normal! T_vt_<CR>
onoremap <silent> a_ :<C-U>normal! F_vf_<CR>

onoremap <silent> i- :<C-U>normal! T-vt-<CR>
onoremap <silent> a- :<C-U>normal! F-vf-<CR>

onoremap <silent> i. :<C-U>normal! T.vt.<CR>
onoremap <silent> a. :<C-U>normal! F.vf.<CR>

onoremap <silent> it :<C-U>normal! T>vt<<CR>
onoremap <silent> at :<C-U>normal! F>vf<<CR>

" find and make result centor
nmap N Nzz
nmap n nzz
nmap g; g;zz
nmap g, g,zz
nmap # #zz
nmap * *zz

" custom command 
" rm blank after lines 
command RTW :%s/\s\+$//e
" close current tab
command Q :on | q
" refresh current window to keep flent
command R :w | e!
" quote words in the line
command QTL :'<,'>s/\v(\w+)/"\1",/g

" plugin manage
" pathogen start
execute pathogen#infect()
execute pathogen#helptags()

" GitGutter Setup
command GT :GitGutterToggle

" NerdTree setup
let NERDTreeIgnore = ['.pyc$', '.swo$', '.swp$']
let NERDTreeShowHidden = 1
command L :NERDTreeToggle
command LL :NERDTreeFind
command V :NERDTreeFind

" pymode setup
try
    let g:pymode = 0
    let g:pymode_options = 0
    let g:pymode_folding = 0
    let g:pymode_lint = 0
    let g:pymode_rope_completion = 0
    let g:pymode_indent = 0
    let g:pymode_rope = 0
"     let g:pymode_rope_completion = 1
   let g:pymode_syntax_all = 1
"     let g:pymode_syntax_highlight_self = 1
"     let g:pymode_syntax_highlight_equal_operator = 1
"     let g:pymode_syntax_builtin_objs = 1
"     let g:pymode_syntax_builtin_types = 1
"     let g:pymode_options_colorcolumn = 1
"     let g:pymode_options_max_line_length = 119
catch
endtry

" YCM
try
    set completeopt-=preview
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_python_binary_path = 'python'
    let g:ycm_goto_buffer_command = 'vertical-split'
    let g:ycm_seed_identifiers_with_syntax = 0
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_cache_omnifunc = 0
"     let g:ycm_collect_identifiers_from_comments_and_strings = 1
"     autocmd FileType python let g:ycm_collect_identifiers_from_comments_and_strings = 0
    nmap gjd :<C-w>YcmCompleter GoTo<CR>
catch
endtry

" syntastic setup
let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712,W391'
let g:minbufexplforcesyntaxenable = 1

let g:javascript_plugin_jsdoc = 1

" powerline setup
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

