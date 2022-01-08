require('telescope').load_extension('file_browser')

local map = vim.keymap.set

map('n', '<leader>n', function()
  require('telescope').extensions.file_browser.file_browser()
end, { silent = true })
