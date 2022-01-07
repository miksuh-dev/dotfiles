local nnoremap = vim.keymap.nnoremap

nnoremap({ '<leader>gf', ':diffget //2<CR>' })
nnoremap({ '<leader>gj', ':diffget //3<CR>' })
nnoremap({ '<leader>gd', ':Gvdiffsplit<CR>', silent = true })
nnoremap({ '<leader>gs', ':G<CR>', silent = true })

nnoremap({ '<leader>gb', ':Git blame<CR>', silent = true })
nnoremap({ '<leader>ge', ':Gedit<CR>', silent = true })

nnoremap({
  '<leader>gs',
  function()
    if vim.bo.filetype ~= 'fugitive' then
      vim.cmd(':G')
    else
      vim.cmd(':q')
    end
  end,
  silent = true,
})
nnoremap({
  '<leader>gb',
  function()
    if vim.bo.filetype ~= 'fugitiveblame' then
      vim.cmd(':Git blame')
    else
      vim.cmd(':q')
    end
  end,

  silent = true,
})
