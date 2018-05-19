syntax enable
colorscheme monokai

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

set number

set cursorline

set wildmenu

set lazyredraw

set showmatch

set incsearch
set hlsearch

set foldenable
set foldlevelstart=99
set foldnestmax=99
set foldmethod=indent
nnoremap <space> za

nnoremap j gj
nnoremap k gk

nnoremap gV `[v`]

inoremap jk <esc>

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set modelines=1

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

au VimLeave * set guicursor=a:ver1-blinkon0
