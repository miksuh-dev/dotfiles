syntax on

set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode

set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:codedark_conservative = 1
set t_Co=256
set t_ut=
colorscheme codedark

if executable('rg')
    let g:rgb_derive_root='true'
endif

let g:netrw_browse_split=2
let g:netrw_winsize=2
let g:python3_host_prog = expand('/usr/bin/python3.7')
let g:python_host_prog = expand('/usr/bin/python2')
set runtimepath^=~/.vim/bundle/ctrlp.vim
