vim.loader.enable()

require('autocmd')
require('opts')

require('globals')
require('disabled')

require('theme.monokai').setup()

require('config')
require('lazy-load')

require('bindings')
require('common.indent-line')
