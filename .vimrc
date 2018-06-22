colorscheme monokai

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
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

set mouse=a

" See https://github.com/neovim/neovim/issues/4474#issuecomment-198757259.
au InsertEnter,InsertChange * silent redraw!
au VimEnter,InsertLeave * silent redraw!

" See https://github.com/Shougo/dein.vim.
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')
  call dein#add('~/.vim/bundles')

  " Configure deoplete
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('scrooloose/nerdtree')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

