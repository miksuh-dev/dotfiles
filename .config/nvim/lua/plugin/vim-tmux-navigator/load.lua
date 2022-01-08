vim.g.tmux_navigator_no_wrap = 1
vim.g.tmux_navigator_no_mappings = 1

local set = vim.keymap.set

set('n', '<C-H>', ':TmuxNavigateLeft<cr>', { silent = true })
set('n', '<C-J>', ':TmuxNavigateDown<cr>', { silent = true })
set('n', '<C-K>', ':TmuxNavigateUp<cr>', { silent = true })
set('n', '<C-L>', ':TmuxNavigateRight<cr>', { silent = true })
set('n', '<C-Space>', ':TmuxNavigatePrevious<cr>', { silent = true })
