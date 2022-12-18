local map = vim.keymap.set
local optsSilent = { noremap = true, silent = true }

map('n', 's', '<cmd>Pounce<CR>', optsSilent)
map('n', 'S', '<cmd>PounceRepeat<CR>', optsSilent)
map('v', 's', '<cmd>Pounce<CR>', optsSilent)
