
-- Transparent
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  highlight FoldColumn  guibg=NONE ctermbg=NONE
  highlight clear LineNr
  highlight clear SignColumn
]])


-- Visual selection
vim.cmd([[
  hi Visual guifg=NONE guibg=#636c81 gui=NONE
]], false)

-- Highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]], false)
