local nnoremap = vim.keymap.nnoremap

nnoremap({ '<leader>gf', ':diffget //2<CR>' })
nnoremap({ '<leader>gj', ':diffget //3<CR>' })
nnoremap({ '<leader>gs', ':G<CR>', silent = true })
nnoremap({ '<leader>ge', ':Gedit<CR>', silent = true })
nnoremap({ '<leader>gb', ':Git blame<CR>', silent = true })
nnoremap({ '<leader>gd', ':Gvdiffsplit<CR>', silent = true })
