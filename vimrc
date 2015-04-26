" @BRIEF  : vimrc�����ļ�
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
Plugin 'vim-scripts/taglist.vim'
" DoxygenToolkit
Plugin 'vim-scripts/DoxygenToolkit.vim'
" NERD Tree
Plugin 'scrooloose/nerdtree'

call vundle#end()
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
" TaglistΪ���һ��windowʱ,exit
let Tlist_Exit_OnlyWindow  = 1
" ���ұ���ʾ
let Tlist_Use_Right_Window = 1
" =======================Tag lists============================
"
" =====================DoxgenToolkit==========================
" ������Ϣ
let g:DoxygenToolkit_authorName="Aleda(aledalee@foxmail.com | aleda.cn)"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" =====================DoxgenToolkit==========================
"
" =====================Basic Configures=======================
syntax on
" �����﷨�۵�
set foldmethod=syntax
" ����Vimʱ��Ĭ�Ϲر��۵�
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
" @NOTICE: ��ֹvi��vim������,�����˸�����
set backspace=indent,eol,start
" ��ֹ��vim��ʽ�£����ѡ��Ĭ�ϳ�virtual
if has('mouse')
    set mouse=
endif
" =====================Basic Configures=======================
