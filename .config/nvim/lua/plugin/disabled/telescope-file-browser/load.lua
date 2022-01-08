require('telescope').load_extension('file_browser')

local set = vim.keymap.set

set('n', '<leader>n', function()
  require('telescope').extensions.file_browser.file_browser()
end, { silent = true })
