-- allow binding functions
vim.cmd([[runtime plugin/astronauta.vim]])

-- Highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='YankVisual', timeout=200 }
  augroup END
]])

-- TODO FIX THIS
-- vim.cmd([[
-- augroup vimrc
-- "   autocmd!
-- "   autocmd FileType netrw if !empty(maparg('<c-l>', 'n')) | unmap <buffer> <C-l>
-- " augroup END
-- ]])
