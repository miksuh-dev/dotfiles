require('autocmd')
require('opts')

require('plugins')
require('globals')
require('disabled')

require('plugin.telescope')
require('plugin.vim-test')
require('plugin.neo-tree')
require('plugin.harpoon')
require('plugin.neogen')
require('plugin.dap')
require('plugin.copilot')

require('theme.monokai').setup()
require('bindings')
