local eslint = require('config.nvim-lspconfig.format.formatter.eslint')
local prettier = require('config.nvim-lspconfig.format.formatter.prettier')
local stylua = require('config.nvim-lspconfig.format.formatter.stylua')

return {
  css = { prettier },
  scss = { prettier },
  graphql = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  ['javascript.jsx'] = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  typescript = { prettier, eslint },
  ['typescript.jsx'] = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}
