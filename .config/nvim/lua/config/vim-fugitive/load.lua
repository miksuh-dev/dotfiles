local map = vim.keymap.set

map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gj', ':diffget //3<CR>')
map('n', '<leader>gd', ':Gvdiffsplit<CR>', { silent = true })

map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
map('n', '<leader>ge', ':Gedit<CR>', { silent = true })

map('n', '<leader>gs', function()
  -- Close if fugitive window
  if vim.bo.filetype == 'fugitive' then
    vim.cmd(':q')
    return
  end

  -- Do not open on non-git dirs
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') == 0 then
    print('File does not belong to a Git repository.')
    return
  end

  vim.cmd(':15split|0Git')
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
