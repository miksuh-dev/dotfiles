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
    autocmd FileType robot set tabstop=4
    autocmd FileType robot set shiftwidth=4

    autocmd BufLeave *.robot set tabstop=4
    autocmd BufLeave *.robot set shiftwidth=4
  augroup END
]])
