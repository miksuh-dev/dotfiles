require('telescope').load_extension('file_browser')

local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>n',
  function()
    require('telescope').extensions.file_browser.file_browser(opts)
  end,
  silent = true,
})
