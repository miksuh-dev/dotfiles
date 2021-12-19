require('autocmd')
require('opts')

require('plugins')
require('globals')
require('disabled')

require('plugin.telescope')
require('plugin.jester')
require('plugin.nvim-tree')

require('theme.monokai').setup()
require('bindings')

vim.cmd(':intro')
