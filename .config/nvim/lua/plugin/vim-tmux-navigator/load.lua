vim.g.tmux_navigator_no_wrap = 1
vim.g.tmux_navigator_no_mappings = 1

local map = vim.keymap.set

map('n', '<C-H>', ':TmuxNavigateLeft<cr>', { silent = true })
map('n', '<C-J>', ':TmuxNavigateDown<cr>', { silent = true })
map('n', '<C-K>', ':TmuxNavigateUp<cr>', { silent = true })
map('n', '<C-L>', ':TmuxNavigateRight<cr>', { silent = true })
map('n', '<C-Space>', ':TmuxNavigatePrevious<cr>', { silent = true })
