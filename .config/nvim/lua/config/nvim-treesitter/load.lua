local ts = require('nvim-treesitter')

vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_matchparen_offscreen = { method = 'popup' }

ts.setup({})
ts.install(require('config.nvim-treesitter.languages'))
