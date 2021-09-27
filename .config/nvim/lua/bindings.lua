-- Clear highlights on space
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true });

-- Keep selection after indent
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

-- Consist y
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Window movement
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', { noremap = true, silent = true  })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', { noremap = true, silent = true  })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', { noremap = true, silent = true })

-- Window resize
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +3<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -3<CR>', { noremap = true, silent = true })

-- Ignore register
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>D', '"_D', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>D', '"_D', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>c', '"_c', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>c', '"_c', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>C', '"_C', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>C', '"_C', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>x', '"_x', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>X', '"_X', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>X', '"_X', { noremap = true })

-- Keeping it centered
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Quick macro
vim.api.nvim_set_keymap('n', '<Space>', '@q', { noremap = true })

-- Alternate file
vim.api.nvim_set_keymap('n', '<BS>', '<C-^>', { noremap = true })

-- Jump longer
vim.api.nvim_set_keymap('n', '<Up>', '5k', { noremap = true })
vim.api.nvim_set_keymap('v', '<Up>', '5k', { noremap = true })

vim.api.nvim_set_keymap('n', '<Down>', '5j', { noremap = true})
vim.api.nvim_set_keymap('v', '<Down>', '5j', { noremap = true})

-- Quick save
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true })

-- Quick increase/decrease
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true })
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true })
