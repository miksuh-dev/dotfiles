local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>', opts)
