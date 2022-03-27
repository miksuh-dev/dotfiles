local map = vim.keymap.set
local optsSilent = { noremap = true, silent = true }

vim.g['test#neovim#term_position'] = 'vert botright'
vim.g['test#strategy'] = 'neovim'

map('n', '<leader>tt', ':TestNearest<CR>', optsSilent)
map('n', '<leader>ta', ':TestSuite<CR>', optsSilent)
map('n', '<leader>tf', ':TestFile<CR>', optsSilent)
map('n', '<leader>tl', ':TestLast<CR>', optsSilent)
map('n', '<leader>tv', ':TestVisit<CR>', optsSilent)
