local filetypes = require('plugin.nvim-ts-autotag.filetypes')
local skip_tags = require('plugin.nvim-ts-autotag.skip_tags')

require('nvim-ts-autotag').setup({
  filetypes,
  skip_tags,
  enable_rename = false,
  enable_close = true,
})
