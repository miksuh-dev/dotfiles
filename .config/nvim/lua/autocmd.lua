-- Highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='YankVisual', timeout=250 }
  augroup END
]])

-- Toggle word wrapping in markdown files
-- TODO Also put this on txt files
vim.cmd([[
  augroup Markdown
    autocmd!
    autocmd FileType markdown set wrap
  augroup END
]])
