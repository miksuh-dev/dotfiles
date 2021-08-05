syntax on

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

let mapleader=','

call plug#begin('~/.vim/plugged')
  " Basic
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'adelarsq/vim-matchit'
  Plug 'tpope/vim-repeat'

  " Syntax/language specific"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'
  Plug 'mattn/emmet-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'mlaursen/vim-react-snippets'

  " Navigation
  Plug 'nvim-telescope/telescope.nvim'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'jremmen/vim-ripgrep'

  " Theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'danilo-augusto/vim-afterglow'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  "DB
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tabnine',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-yank',
  \ 'coc-explorer',
  \ 'coc-db',
  \ ]

set hidden
set cmdheight=1
set updatetime=50

" coc-explorer
let g:coc_explorer_global_presets = {
\   'files': {
\     'sources': [{'name': 'file', 'expand': v:true}]
\    },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

nnoremap <leader>n :CocCommand explorer --preset files<CR>
nnoremap <leader>b :CocCommand explorer --preset buffer<CR>


" " JS syntax
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" emmet
let g:user_emmet_settings = {
  \  'javascript' : {
  \     'quote_char': "",
  \     'extends' : 'jsx',
  \  },
  \}

"Fugitive
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gc :GBranches<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"DB UI
let g:db_ui_auto_execute_table_helpers = 1
let g:db_ui_force_echo_notifications = 1

lua << EOF
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      ".git/.*",
      "node_modules/.*",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-s>"] = actions.select_horizontal,
        ["<c-o>"] = actions.select_vertical,
        ["<c-q>"] = actions.send_to_qflist,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
        preview_height = 40,
      },
      center = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.95,
    preview_cutoff = 120,
    results_height = 0.95,
    results_width = 0.95,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

"Gitgutter
" Only run on save
autocmd BufWritePost * GitGutter

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

" nmap ghs <Plug>(GitGutterStageHunk)
" nmap ghu <Plug>(GitGutterUndoHunk)

"Airline
let g:airline_section_y = ''
let g:airline#extensions#hunks#enabled=0
let g:airline_highlighting_cache = 1
let g:airline_experimental=1

" Strip whitespaces on save
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Coc

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

nnoremap <Leader>k :call CocAction('diagnosticPrevious')<CR>
nnoremap <Leader>j :call CocAction('diagnosticNext')<CR>


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent>gf :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>c "_c
vnoremap <leader>c "_c

" Keeping it centered
noremap n nzzzv
noremap N Nzzzv
nnoremap J mzJ`z

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" quick macro
nnoremap <Space> @q

" 'edit alternate file' convenience mapping
nnoremap <BS> <C-^>

" Jump longer
noremap <Up> 5k
noremap <Down> 5j

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Select all
nnoremap <leader>a ggVG

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Show floating info diagnostic info
nnoremap <silent> <leader>? :call CocAction('diagnosticInfo') <CR>

" Mappings for CoCList
" Search workspace symbols.
" nnoremap <silent><nowait> <Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <Leader>p  :<C-u>CocListResume<CR>

func! s:my_colors_setup() abort
  hi Pmenu guibg=#353a3d gui=NONE
  hi PmenuSel guibg=#6a747a gui=NONE
  hi PmenuSbar guibg=#bcbcbc
  hi PmenuThumb guibg=#585858
endfunc

augroup colorscheme_coc_setup | au!
  au ColorScheme * call s:my_colors_setup()
augroup END

" highlight clear LineNr
" highlight LineNr guifg=#050505
" highlight clear SignColumn

colorscheme afterglow
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='flatdark'

if executable('rg')
  let g:rgb_derive_root='true'
endif

highlight clear LineNr
highlight clear SignColumn

let g:netrw_browse_split=2
let g:netrw_winsize=2
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
