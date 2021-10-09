vim.cmd('syntax on')

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.incsearch = true
vim.o.backup = false
vim.o.errorbells = false
vim.o.showmode = false
vim.o.swapfile = false
vim.o.wrap = false
vim.wo.scrolloff = 8
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.o.smartcase = true

vim.o.smartindent = true
vim.bo.smartindent = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.tabstop = 4
vim.bo.tabstop = 4

vim.o.softtabstop = 4
vim.bo.softtabstop = 4

vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.wrapscan = false
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.cmdheight = 1

vim.o.hidden = true
vim.o.hlsearch = true
vim.o.updatetime = 50
vim.o.completeopt = 'menuone,noselect'
vim.o.ignorecase = true
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'

vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.g.mapleader = ','

vim.g.netrw_browse_split = 2
vim.g.netrw_winsize = 2
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0

-- vim.opt.lazyredraw = true -- Remove this if render issues

vim.cmd([[
  if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_words = '<:>,' .  '<\@<=!--:-->,'.  '<\@<=?\k\+:?>,'.  '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.  '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'.  '\<if\>:\<else\>'
  endif
]])

vim.cmd([[
  let g:sneak#s_next = 1
]])
