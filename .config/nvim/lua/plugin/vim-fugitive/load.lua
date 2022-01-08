local set = vim.keymap.set

set('n', '<leader>gf', ':diffget //2<CR>')
set('n', '<leader>gj', ':diffget //3<CR>')
set('n', '<leader>gd', ':Gvdiffsplit<CR>', { silent = true })
set('n', '<leader>gs', ':G<CR>', { silent = true })

set('n', '<leader>gb', ':Git blame<CR>', { silent = true })
set('n', '<leader>ge', ':Gedit<CR>', { silent = true })

set('n', '<leader>gs', function()
  if vim.bo.filetype ~= 'fugitive' then
    vim.cmd(':G')
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})

set('n', '<leader>gb', function()
  if vim.bo.filetype ~= 'fugitiveblame' then
    vim.cmd(':Git blame')
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})
