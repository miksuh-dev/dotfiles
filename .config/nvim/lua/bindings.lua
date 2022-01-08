local set = vim.keymap.set

local opts = { noremap = true }
local optsSilent = { noremap = true, silent = true }

-- Clear search on space
set('n', '<CR>', ':noh<CR><CR>', optsSilent)

-- Keep selection after indent
set('v', '>', '>gv', opts)
set('v', '<', '<gv', opts)

-- Consist y
set('n', 'Y', 'y$', opts)

-- Window resize
set('n', '<C-Left>', ':vertical resize +3<Cr>', optsSilent)
set('n', '<C-Right>', ':vertical resize -3<CR>', optsSilent)
set('n', '<C-Up>', ':resize +3<CR>', optsSilent)
set('n', '<C-Down>', ':resize -3<CR>', optsSilent)

-- Ignore register
set('n', '<leader>d', '"_d', opts)
set('v', '<leader>d', '"_d', opts)

set('n', '<leader>D', '"_D', opts)
set('v', '<leader>D', '"_D', opts)

set('n', '<leader>c', '"_c', opts)
set('v', '<leader>c', '"_c', opts)

set('n', '<leader>C', '"_C', opts)
set('v', '<leader>C', '"_C', opts)

set('n', '<leader>x', '"_x', opts)
set('v', '<leader>x', '"_x', opts)

set('n', '<leader>X', '"_X', opts)
set('v', '<leader>X', '"_X', opts)

-- Keeping it centered
set('n', 'n', 'nzzzv', opts)
set('n', 'N', 'Nzzzv', opts)
set('n', 'J', 'mzJ`z', opts)

-- Quick macro
set('n', '<BS>', '@q', opts)

-- Alternate file
set('n', '<Space>', '<C-^>', opts)

-- Jump longer
set('n', '<Up>', '5k', opts)
set('v', '<Up>', '5k', opts)

set('n', '<Down>', '5j', opts)
set('v', '<Down>', '5j', opts)

-- Quick increase/decrease
set('n', '-', '<C-x>', opts)
set('n', '+', '<C-a>', opts)

-- Move visual selection
set('v', '<C-k>', ":m '<-2<CR>gv=gv", opts)
set('v', '<C-j>', ":m '>+1<CR>gv=gv", opts)

-- Quickfix and location list toggle
set('n', '<leader>q', ":lua require('common.list').toggle_quickfix_list()<CR>", optsSilent)
set('n', '<leader>l', ":lua require('common.list').toggle_location_list()<CR>", optsSilent)

-- Source lua file
set('n', '<leader>so', function()
  if vim.bo.filetype == 'lua' then
    vim.cmd(':luafile %')
    print('Sourced ' .. vim.fn.bufname())
  end
end, {
  silent = true,
})

set('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)

-- Auto center after mark jump
set('n', "'", '"\'" . nr2char(getchar()) . "zz"', { noremap = true, expr = true })
set('n', '`', '"`" . nr2char(getchar()) . "zz"', { noremap = true, expr = true })
