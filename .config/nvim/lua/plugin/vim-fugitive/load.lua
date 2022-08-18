local map = vim.keymap.set

map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gj', ':diffget //3<CR>')
map('n', '<leader>gd', ':Gvdiffsplit<CR>', { silent = true })

map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
map('n', '<leader>ge', ':Gedit<CR>', { silent = true })

map('n', '<leader>gs', function()
  if vim.bo.filetype ~= 'fugitive' then
    local success = pcall(vim.cmd, ':15split|0Git')
    if not success then
      print('File does not belong to a Git repository.')
    end
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})

map('n', '<leader>gb', function()
  if vim.bo.filetype ~= 'fugitiveblame' then
    local success = pcall(vim.cmd, ':Git blame')
    if not success then
      print('File does not belong to a Git repository.')
    end
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})
