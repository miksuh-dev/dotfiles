require('autocmd')
require('opts')

require('plugins')
require('globals')

require('plugin.telescope')
require('plugin.nvim-tree')
require('plugin.jester')
require('plugin.coq')

require('disabled')
require('theme.monokai').setup()
require('bindings')
