local nnoremap = vim.keymap.nnoremap

-- TODO: make these require vim-fugitive -> rename this file to init.lua
nnoremap({ '<leader>gf', ':diffget //2<CR>' })
nnoremap({ '<leader>gj', ':diffget //3<CR>' })
nnoremap({ '<leader>gs', ':G<CR>', silent = true })
nnoremap({ '<leader>gb', ':Git blame<CR>', silent = true })
nnoremap({ '<leader>gd', ':Gvdiffsplit<CR>', silent = true })
