local map = vim.keymap.set
local optsSilent = { noremap = true, silent = true }

map('n', '<leader>b', ':Kanban<CR>', optsSilent)
