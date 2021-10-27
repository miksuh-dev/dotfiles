require('autocmd')
require('opts')

require('plugins')

-- TODO: Change this to a Loop which loops through plugin folder and autoload each init.lua inside plugin's folder.
require('plugin.telescope')
require('plugin.nvim-tree')

require('disabled')
require('theme.monokai').setup()
require('bindings')
