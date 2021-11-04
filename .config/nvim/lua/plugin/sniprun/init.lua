local vnoremap = vim.keymap.vnoremap

vnoremap({
  '<leader>r',
  function()
    require('sniprun').run('v')
  end,
  silent = true,
})
