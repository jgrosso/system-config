colorscheme monokai

nnoremap <Space> <Nop>
let mapleader = " "

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
nnoremap <leader>f<TAB> za

set autoindent

nnoremap j gj
nnoremap k gk

nnoremap gV `[v`]

inoremap jk <esc>
inoremap fd <esc>

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

  " Configure FZF
  set rtp+=/usr/local/opt/fzf
  call dein#add('junegunn/fzf.vim')

  " Configure JavaScript
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('w0rp/ale')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" Configure powerline
let g:airline_theme='base16'

" Configure linter
let g:ale_linters = {
\    'javascript': ['eslint'],
\}
nnoremap <leader>en :ALENext<CR>
nnoremap <leader>ep :ALEPrevious<CR>

nnoremap <leader>ft :NERDTree<CR>

" Configure fuzzy finder
nnoremap <leader>pf :FZF<CR>
" See https://github.com/junegunn/fzf.vim#advanced-customization<Paste>.
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\		'rg --column --line-number --no-heading --color=never --smart-case '.shellescape(<q-args>), 1,
	\ 	<bang>0 ? fzf#vim#with_preview('up:60%')
  \				    : fzf#vim#with_preview('right:50%:hidden', '?'),
	\	  <bang>0)
nnoremap <leader>/ :Ag<CR>

set hidden

nnoremap <silent> <leader>fs :write<CR>

nnoremap <silent> <leader>fed :edit ~/.vimrc<CR>
nnoremap <silent> <leader>feR :source ~/.vimrc<CR>

nnoremap <silent> <leader>sc :noh<CR>

nnoremap <silent> <leader><TAB> :e#<CR>
nnoremap <silent> <leader>bd :e#<BAR>bw#<CR>
nnoremap <leader>bb :buffers<CR>:b

nnoremap <silent> <leader>tn :tab new<CR>
nnoremap <silent> <leader>td :close<CR>

nnoremap <silent> <leader>w2 :vs<CR>
nnoremap <silent> <leader>w<BAR> :split<CR>
nnoremap <silent> <leader>w<TAB> <C-w><C-w>
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wd :close!<CR>

tnoremap <ESC> <C-\><C-n>
tnoremap <C-\><C-n> <ESC>

inoremap <silent> <A-BS> <C-w>

set clipboard=unnamedplus

" See https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

noremap <MiddleMouse> <NOP>
noremap <2-MiddleMouse> <NOP>
noremap <3-MiddleMouse> <NOP>
noremap <4-MiddleMouse> <NOP>
