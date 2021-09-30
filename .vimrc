
set clipboard=unnamedplus
set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set nowrap
set nu
set relativenumber
set scrolloff=8
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set tabstop=4 softtabstop=4
set termguicolors
set undodir=~/.vim/undodir
set undofile
set nowrapscan
set ignorecase
set nocompatible

set hidden
set cmdheight=1
set updatetime=50

if !has("compatible")
  syntax on

  let mapleader=','

  " Strip whitespaces on save
  function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  colorscheme torte
end

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Keep selection after indent
vmap > >gv
vmap < <gv

" Make Y consistent with C and D
nnoremap Y y$

" Remap window movement to C-h ... C-l
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Remap window resize to C-left ... C-right
nnoremap <silent> <C-Left> :vertical resize +3<Cr>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>c "_c
vnoremap <leader>c "_c

nnoremap <leader>D "_D
vnoremap <leader>D "_D

nnoremap <leader>C "_C
vnoremap <leader>C "_C

" Keeping it centered
noremap n nzzzv
noremap N Nzzzv
nnoremap J mzJ`z

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" Quick macro
nnoremap <Space> @q

" 'edit alternate file' convenience mapping
nnoremap <BS> <C-^>

" Jump longer
noremap <Up> 5k
noremap <Down> 5j

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

nnoremap + <C-a>
nnoremap - <C-x>

" Visual line color
"hi Visual guifg=NONE guibg=#636c81 gui=none

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

hi Normal guibg=NONE ctermbg=NONE

highlight clear LineNr
highlight clear SignColumn
