local map = vim.keymap.set

-- load refactoring Telescope extension
require('telescope').load_extension('refactoring')

map(
  'v',
  '<leader>rr',
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true, silent = true }
)

map('n', '<leader>rp', function()
  require('refactoring').debug.printf({ below = true })
end, {
  noremap = true,
  silent = true,
})

map('v', '<leader>rv', function()
  require('refactoring').debug.print_var({})
end, {
  noremap = true,
  silent = true,
})

-- Cleanup function: this remap should be made in normal mode
map('n', '<leader>rc', function()
  require('refactoring').debug.cleanup({})
end, {
  noremap = true,
  silent = true,
})
