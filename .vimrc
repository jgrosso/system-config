" https://github.com/Shougo/dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')
  
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('mhartington/nvim-typescript')
  call dein#add('rust-lang/rust', { 'ft': ['rs'] })
  call dein#add('HerringtonDarkholme/yats.vim')

  call dein#end()
  call dein#save_state()
endif

syntax enable

set tabstop=2
set shiftwidth=2
set softtabstop=2
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

inoremap fd <esc>

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set modelines=1

au VimLeave * set guicursor=a:ver1-blinkon0

let g:deoplete#enable_at_startup = 1
