require('autocmd')
require('opts')

require('plugins')
require('globals')
require('disabled')

require('plugin.telescope')
require('plugin.jester')
require('plugin.neo-tree')
require('plugin.harpoon')
require('plugin.neogen')

require('theme.monokai').setup()
require('bindings')
