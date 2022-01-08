local map = vim.keymap.set

map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gj', ':diffget //3<CR>')
map('n', '<leader>gd', ':Gvdiffsplit<CR>', { silent = true })
map('n', '<leader>gs', ':G<CR>', { silent = true })

map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
map('n', '<leader>ge', ':Gedit<CR>', { silent = true })

map('n', '<leader>gs', function()
  if vim.bo.filetype ~= 'fugitive' then
    vim.cmd(':G')
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})

map('n', '<leader>gb', function()
  if vim.bo.filetype ~= 'fugitiveblame' then
    vim.cmd(':Git blame')
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})
