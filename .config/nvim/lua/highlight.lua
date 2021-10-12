-- Transparent
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight FoldColumn  guibg=NONE ctermbg=NONE
  highlight clear LineNr
  highlight clear SignColumn
]])

-- Visual selection
vim.cmd([[
  highlight Visual guifg=NONE guibg=#636c81 gui=NONE
]])
