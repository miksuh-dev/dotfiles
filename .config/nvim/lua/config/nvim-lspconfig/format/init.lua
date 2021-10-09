local eslint = require('config.nvim-lspconfig.format.formatter.eslint')
local prettier = require('config.nvim-lspconfig.format.formatter.prettier')
local stylua = require('config.nvim-lspconfig.format.formatter.stylua')

return {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}
