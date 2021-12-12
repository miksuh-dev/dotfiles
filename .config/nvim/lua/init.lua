require('autocmd')
require('opts')

require('plugins')
require('globals')
require('disabled')

require('plugin.telescope')
require('plugin.jester')
require('plugin.nvim-tree')
require('plugin.vim-dadbod-ui')

require('theme.monokai').setup()
require('bindings')
