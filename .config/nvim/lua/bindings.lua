local opts = { noremap = true }
local optsSilent = { noremap = true, silent = true }

-- Clear search on space
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', optsSilent)

-- Keep selection after indent
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- Consist y
vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)

-- Window movement
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', optsSilent)
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', optsSilent)
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', optsSilent)
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', optsSilent)

-- Window resize
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +3<Cr>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -3<CR>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +3<CR>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -3<CR>', optsSilent)

-- Ignore register
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', opts)
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', opts)

vim.api.nvim_set_keymap('n', '<leader>D', '"_D', opts)
vim.api.nvim_set_keymap('v', '<leader>D', '"_D', opts)

vim.api.nvim_set_keymap('n', '<leader>c', '"_c', opts)
vim.api.nvim_set_keymap('v', '<leader>c', '"_c', opts)

vim.api.nvim_set_keymap('n', '<leader>C', '"_C', opts)
vim.api.nvim_set_keymap('v', '<leader>C', '"_C', opts)

vim.api.nvim_set_keymap('n', '<leader>x', '"_x', opts)
vim.api.nvim_set_keymap('v', '<leader>x', '"_x', opts)

vim.api.nvim_set_keymap('n', '<leader>X', '"_X', opts)
vim.api.nvim_set_keymap('v', '<leader>X', '"_X', opts)

-- Keeping it centered
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- Quick macro
vim.api.nvim_set_keymap('n', '<Space>', '@q', opts)

-- Alternate file
vim.api.nvim_set_keymap('n', '<BS>', '<C-^>', opts)

-- Jump longer
vim.api.nvim_set_keymap('n', '<Up>', '5k', opts)
vim.api.nvim_set_keymap('v', '<Up>', '5k', opts)

vim.api.nvim_set_keymap('n', '<Down>', '5j', opts)
vim.api.nvim_set_keymap('v', '<Down>', '5j', opts)

-- Quick increase/decrease
vim.api.nvim_set_keymap('n', '-', '<C-x>', opts)
vim.api.nvim_set_keymap('n', '+', '<C-a>', opts)
