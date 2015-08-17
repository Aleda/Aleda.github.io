" @BRIEF  : vimrc配置文件
" @AUTHOR : Aleda(aledalee@foxmail.com | aleda.cn)
" @DATE   : 2015-03-28 23:05
" @VERSION: 1.0.0
" @USAGE  :
" ===================Vundle Begin=============================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/lishuo/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" solarized color
Plugin 'altercation/vim-colors-solarized'
" taglist
" Abandoned.
" Plugin 'vim-scripts/taglist.vim'
" DoxygenToolkit
Plugin 'vim-scripts/DoxygenToolkit.vim'
" NERD Tree
Plugin 'scrooloose/nerdtree'
" scrooloose/syntastic
Plugin 'scrooloose/syntastic'
" TagBar
Plugin 'majutsushi/tagbar'

" ================= go =================
" fatih/vim-go
Plugin 'fatih/vim-go'
" ================= go =================


call vundle#end()
" This is Required... for go & others
filetype plugin on
" ====================Vundle End==============================
syntax enable
" ==================Solarized Color Theme=====================
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
" ==================Solarized Color Theme=====================
"
" =======================Tag lists============================
" Taglist为最后一个window时,exit
let Tlist_Exit_OnlyWindow  = 1
" 在右边显示
let Tlist_Use_Right_Window = 1
" =======================Tag lists============================
"
" =====================DoxgenToolkit==========================
" 作者信息
let g:DoxygenToolkit_authorName="Aleda(aledalee@foxmail.com | aleda.cn)"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" =====================DoxgenToolkit==========================
"
" =====================Basic Configures=======================
syntax on
" 设置语法折叠
set foldmethod=syntax
" 启动Vim时候，默认关闭折叠
set nofoldenable
set nobackup
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
retab
set nu
set hlsearch
set incsearch
set fileencodings=ucs-bom,utf-8,gbk,gb18030,cp936,big5,euc-jp,euc-kr,latin1
set fileformats=unix
set fileencoding=gb18030
set fenc=utf-8
set fencs=utf-8,usc-bom,gb2312,cp936
set encoding=utf-8
set termencoding=utf-8
" public auto indent
set cino=g0
set nocp
" @NOTICE: 防止vi和vim不兼容,导致退格不能用
set backspace=indent,eol,start
" 防止在vim方式下，鼠标选中默认成virtual
if has('mouse')
    set mouse=
endif
" =====================Basic Configures=======================

" =======================Map Configures=======================
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
" =======================Map Configures=======================
" =======================NMap Configures======================
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" =======================NMap Configures======================
