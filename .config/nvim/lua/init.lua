require('autocmd')
require('opts')

require('plugins')
require('globals')
require('disabled')

require('plugin.telescope')
require('plugin.neo-tree')
require('plugin.harpoon')
require('plugin.copilot')
-- require('plugin.react-extract')
require('plugin.kanban')

require('theme.monokai').setup()
require('bindings')
