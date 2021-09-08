
-- Compe
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>',  [[ compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()")) ]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({"delta": +4})', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({"delta": -6})', { noremap = true, silent = true, expr = true })

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Fugitive
vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>', { noremap = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>lua require("telescope.builtin").git_files()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").git_status()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true})

-- Lspsaga
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>a', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>?', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', { noremap = true, silent = true }) 

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

-- Set cursor position
-- vim.api.nvim_set_keymap('n', 'J', [[ :m '>+1<CR>gv=gv" ]], { noremap = true })

-- Quick save (insert, normal, visual)
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-S>', '<C-C>:w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<C-O>:w<CR>', { noremap = true })

-- Quick increase/decrease
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true })
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true })

-- Quick format
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>fo', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', { noremap = true })


