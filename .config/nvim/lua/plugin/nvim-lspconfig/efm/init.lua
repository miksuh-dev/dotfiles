-- local eslint = require('plugin.nvim-lspconfig.efm.formatter.eslint')
local prettier = require('plugin.nvim-lspconfig.efm.formatter.prettier')
local stylua = require('plugin.nvim-lspconfig.efm.formatter.stylua')

return {
  css = { prettier },
  scss = { prettier },
  graphql = { prettier },
  html = { prettier },
  javascript = { prettier },
  ['javascript.jsx'] = { prettier },
  javascriptreact = { prettier },
  typescript = { prettier },
  ['typescript.jsx'] = { prettier },
  typescriptreact = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  yaml = { prettier },
  vue = { prettier },
}
