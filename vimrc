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
" ack.vim
Plugin 'mileszs/ack.vim'
" ctrlp
Plugin 'kien/ctrlp.vim'
" neocomplete
Plugin 'Shougo/neocomplete.vim'
" Shougo/neosnippet
Plugin 'Shougo/neosnippet'
" Shougo/neosnippet-snippets
Plugin 'Shougo/neosnippet-snippets'
" honza/vim-snippets
Plugin 'honza/vim-snippets'
" vim-airline
"Plugin 'bling/vim-airline'
" plasticboy/vim-markdown
Plugin 'plasticboy/vim-markdown'


" ================= go =================
" fatih/vim-go
Plugin 'fatih/vim-go'


call vundle#end()
" This is Required... for go & others
filetype plugin on
filetype indent on
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
"let Tlist_Exit_OnlyWindow  = 1
" 在右边显示
"let Tlist_Use_Right_Window = 1
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
set foldmethod=indent
" 启动Vim时候，默认关闭折叠
set foldenable
set nobackup
set smarttab
set smartcase
set tabstop=4
set shiftwidth=4
"set expandtab
set autoindent
set cindent
retab
set nu
set ruler
set hlsearch
set incsearch
set fileencodings=ucs-bom,utf-8,gbk,gb18030,cp936,big5,euc-jp,euc-kr,latin1
set fileformats=unix
set fileencoding=gb18030
set fenc=utf-8
set fencs=utf-8,usc-bom,gb2312,cp936
set encoding=utf-8
set termencoding=utf-8
"
set showmatch                   " Show matching brackets/parenthesis
set wildmenu
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5
set scrolloff=3
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" public auto indent
set cino=g0
set nocp
" @NOTICE: 防止vi和vim不兼容,导致退格不能用
set backspace=indent,eol,start
" 防止在vim方式下，鼠标选中默认成virtual
if has('mouse')
    set mouse=
endif
let mapleader=","
set showcmd
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set cursorline
set showmode
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
" =====================Basic Configures=======================


" ========================vim-airline=========================
"let g:airline#extensions#tabline#enabled = 1
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\                     " Filename
	set statusline+=%w%h%m%r                 " Options
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"if !exists('g:airline_theme')
	let g:airline_theme = 'solarized'
"endif
"if !exists('g:airline_powerline_fonts')
	" Use the default set of separators with a few customizations
	let g:airline_left_sep='›'  " Slightly fancier than '>'
	let g:airline_right_sep='‹' " Slightly fancier than '<'
"endif
" ========================vim-airline=========================
"
" ======================neosnippet let=======================
"Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"SuperTab like snippets behavior.
"imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
"			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
" ======================neosnippet let=======================
"
" ======================neocomplete&snipts=======================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <C-k> Complete Snippet
" <C-k> Jump to next snippet point
imap <silent><expr><C-k> neosnippet#expandable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
			\ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
"inoremap <expr><CR> neocomplete#complete_common_string()

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

function! CleverCr()
	if pumvisible()
		if neosnippet#expandable()
			let exp = "\<Plug>(neosnippet_expand)"
			return exp . neocomplete#smart_close_popup()
		else
			return neocomplete#smart_close_popup()
		endif
	else
		return "\<CR>"
	endif
endfunction

" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#smart_close_popup()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" Courtesy of Matteo Cavalleri
function! CleverTab()
	if pumvisible()
		return "\<C-n>"
	endif
	let substr = strpart(getline('.'), 0, col('.') - 1)
	let substr = matchstr(substr, '[^ \t]*$')
	if strlen(substr) == 0
		" nothing to match on empty string
		return "\<Tab>"
	else
		" existing text matching
		if neosnippet#expandable_or_jumpable()
			return "\<Plug>(neosnippet_expand_or_jump)"
		else
			return neocomplete#start_manual_complete()
		endif
	endif
endfunction
imap <expr> <Tab> CleverTab()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ======================neocomplete&snipts=======================

" =======================Map Configures=======================
nmap <C-e> :NERDTreeToggle<CR>
map <C-n> :TagbarToggle<CR>
nnoremap <silent> <leader>tt :TagbarToggle<CR>
" =======================Map Configures=======================

" =======================Auto cmd=============================
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"=======================Auto cmd=============================

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
au FileType go nmap <Leader>q <Plug>(go-import)
" =======================NMap Configures======================
