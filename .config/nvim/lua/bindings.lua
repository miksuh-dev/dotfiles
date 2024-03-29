local map = vim.keymap.set

local opts = { noremap = true }
local optsSilent = { noremap = true, silent = true }

-- Clear search on space
map('n', '<CR>', ':noh<CR><CR>', optsSilent)

-- Keep selection after indent
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- Consist y
map('n', 'Y', 'y$', opts)

-- Window resize
map('n', '<C-Left>', ':vertical resize +3<Cr>', optsSilent)
map('n', '<C-Right>', ':vertical resize -3<CR>', optsSilent)
map('n', '<C-Up>', ':resize +3<CR>', optsSilent)
map('n', '<C-Down>', ':resize -3<CR>', optsSilent)

-- Ignore register
map('n', '<leader>d', '"_d', opts)
map('v', '<leader>d', '"_d', opts)

map('n', '<leader>D', '"_D', opts)
map('v', '<leader>D', '"_D', opts)

map('n', '<leader>c', '"_c', opts)
map('v', '<leader>c', '"_c', opts)

map('n', '<leader>C', '"_C', opts)
map('v', '<leader>C', '"_C', opts)

map('n', '<leader>x', '"_x', opts)
map('v', '<leader>x', '"_x', opts)

map('n', '<leader>X', '"_X', opts)
map('v', '<leader>X', '"_X', opts)

-- Keeping it centered
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mzJ`z', opts)

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Quick macro
map('n', '<BS>', '@q', opts)

-- Alternate file
map('n', '<Space>', '<C-^>', opts)

-- Move visual selection
map('v', '<C-k>', ":m '<-2<CR>gv=gv", optsSilent)
map('v', '<C-j>', ":m '>+1<CR>gv=gv", optsSilent)

-- Quickfix and location list toggle
map('n', '<leader>q', ":lua require('common.list').toggle_quickfix_list()<CR>", optsSilent)
map('n', '<leader>l', ":lua require('common.list').toggle_location_list()<CR>", optsSilent)

-- Terminal leave insert instead of exit in terminal
map('t', '<Esc>', '<C-\\><C-n>', optsSilent)

-- Terminal Exit insert and scroll
map('t', '<c-u>', '<C-\\><C-n><c-u>', optsSilent)
map('t', '<c-d>', '<C-\\><C-n><c-d>', optsSilent)

-- Make line jumping work when 'set wrap'
map('n', 'j', function()
  return vim.v.count ~= 0 and 'j' or 'gj'
end, { silent = true, expr = true })

map('n', 'k', function()
  return vim.v.count ~= 0 and 'k' or 'gk'
end, { silent = true, expr = true })

-- Source lua file
map('n', '<leader>so', function()
  if vim.bo.filetype == 'lua' then
    vim.cmd(':luafile %')
    print('Sourced ' .. vim.fn.bufname())
  end
end, {
  silent = true,
})

map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)

-- Auto center after mark jump
map('n', "'", '"\'" . nr2char(getchar()) . "zz"', { noremap = true, expr = true })
map('n', '`', '"`" . nr2char(getchar()) . "zz"', { noremap = true, expr = true })

-- map
map('i', '<C-p>', '<C-R>"', { noremap = true, silent = true })

vim.cmd([[
  command! -nargs=* Wrap set wrap linebreak nolist
]])

vim.cmd([[
  xnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

-- Quick search and replace
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
