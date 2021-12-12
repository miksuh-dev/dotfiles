require('autocmd')
require('opts')

require('plugins')
require('globals')

require('plugin.telescope')
require('plugin.jester')
require('plugin.nvim-tree')
require('plugin.vim-dadbod-ui')

require('disabled')
require('theme.monokai').setup()
require('bindings')
