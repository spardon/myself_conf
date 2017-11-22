" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" http://www.vim.org/scripts/download_script.php?src_id=4055
"
set t_Co=256
set background=dark
" colorscheme desert256
syntax enable

set fileencodings=utf-8,gbk,ucs-bom
set nocompatible
set bs=indent,eol,start
set rtp+=~/.vim/bundle/Vundle.vim
set ts=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set nobackup
set foldmethod=manual
set foldlevel=5
set pastetoggle=<F7>
set wildignore+=*.swp,*.zip,*.pyc
set autochdir
set cursorline
set hlsearch
set colorcolumn=80

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/mru.vim'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'tell-k/vim-autopep8'
Plugin 'leafgarland/typescript-vim'
call vundle#end()

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <F2> :CtrlPClearCache<cr>
map <F3> :NERDTree<CR>
map <F5> :w<cr>:!python %<cr>
map :ag :Ag! 
vmap /// y:Ag! <c-r>"<cr>

let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$', 'tags']
let &runtimepath.=',~/.vim/bundle/ale'
let g:ale_python_flake8_args="--ignore=E501"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let &termencoding=&encoding
let g:ale_sign_error = '●'
let g:ale_sign_warning = '-'
au BufNewFile,BufRead *.mako set ft=mako
au BufNewFile,BufRead *.coffee set ft=coffee
highlight ALEErrorSign ctermfg=124 cterm=bold
highlight ALEWarningSign ctermfg=178 cterm=bold
highlight CursorLine cterm=NONE guibg=lightblue ctermbg=234
highlight Pmenu ctermfg=250 ctermbg=235 guifg=#ffffff guibg=#0000ff
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
highlight clear SignColumn

hi ColorColumn ctermbg=233
filetype plugin indent on

func SetTitle() 
    call setline(1,"#!/usr/bin/env python") 
    call append(1, "# -*- coding:utf-8 -*-") 
    normal G 
    normal o
    normal o
endfunc 
autocmd bufnewfile *.py call SetTitle()
