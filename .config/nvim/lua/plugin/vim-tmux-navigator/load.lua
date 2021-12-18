vim.g.tmux_navigator_no_wrap = 1
vim.g.tmux_navigator_no_mappings = 1

local nnoremap = vim.keymap.nnoremap

nnoremap({ '<C-H>', ':TmuxNavigateLeft<cr>', silent = true })
nnoremap({ '<C-J>', ':TmuxNavigateDown<cr>', silent = true })
nnoremap({ '<C-K>', ':TmuxNavigateUp<cr>', silent = true })
nnoremap({ '<C-L>', ':TmuxNavigateRight<cr>', silent = true })
nnoremap({ '<C-Space>', ':TmuxNavigatePrevious<cr>', silent = true })
