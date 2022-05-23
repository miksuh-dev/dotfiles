local map = vim.keymap.set

-- load refactoring Telescope extension
require('telescope').load_extension('refactoring')

map(
  'v',
  '<leader>rr',
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true, silent = true }
)
