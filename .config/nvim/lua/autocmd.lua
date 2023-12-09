-- Highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='YankVisual', timeout=250 }
  augroup END
]])

-- Toggle word wrapping in txt/md files
vim.cmd([[
  augroup autowrap
    autocmd!
    autocmd FileType markdown,text set wrap
    autocmd FileType markdown,text set linebreak
  augroup END
]])

-- External formatters
vim.cmd([[
  autocmd FileType xml nmap <buffer> <leader>fo %! xmllint --format -<CR>
  autocmd FileType xml vmap <buffer> <leader>fo ! xmllint --format -<CR>
]])

-- Toggle tab size for robot framework files
vim.cmd([[
  augroup autotabsize
    autocmd!
    autocmd BufEnter *.robot set tabstop=4
    autocmd BufEnter *.robot set shiftwidth=4

    autocmd BufLeave *.robot set tabstop=2
    autocmd BufLeave *.robot set shiftwidth=2
  augroup END
]])

vim.cmd('cnoreabbrev Q  q')
vim.cmd('cnoreabbrev q1  q!')
vim.cmd('cnoreabbrev Q1  q!')
vim.cmd('cnoreabbrev Qa1 qa!')
vim.cmd('cnoreabbrev Qa qa')
vim.cmd('cnoreabbrev W  w')
vim.cmd('cnoreabbrev Wq wq')
vim.cmd('cnoreabbrev WQ wq')
