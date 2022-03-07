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
  augroup END
]])
