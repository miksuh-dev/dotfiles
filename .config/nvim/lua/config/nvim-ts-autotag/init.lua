local filetypes = require('config.nvim-ts-autotag.filetypes')
local skip_tags = require('config.nvim-ts-autotag.skip_tags')

require('nvim-ts-autotag').setup({
  filetypes,
  skip_tags,
})
