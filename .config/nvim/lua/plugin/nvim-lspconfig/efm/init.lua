local eslint = require('plugin.nvim-lspconfig.efm.formatter.eslint')
local prettier = require('plugin.nvim-lspconfig.efm.formatter.prettier')
local stylua = require('plugin.nvim-lspconfig.efm.formatter.stylua')

return {
  css = { prettier },
  scss = { prettier },
  graphql = { prettier },
  html = { prettier },
  javascript = {
    prettier, --[[ eslint ]]
  },
  ['javascript.jsx'] = {
    prettier, --[[ eslint ]]
  },
  javascriptreact = {
    prettier, --[[ eslint ]]
  },
  typescript = {
    prettier, --[[ eslint ]]
  },
  ['typescript.jsx'] = {
    prettier, --[[ eslint ]]
  },
  typescriptreact = {
    prettier, --[[ eslint ]]
  },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  yaml = { prettier },
  vue = { eslint, prettier },
}

-- return {
--   css = { prettier },
--   scss = { prettier },
--   graphql = { prettier },
--   html = { prettier },
--   javascript = { prettier, eslint },
--   ['javascript.jsx'] = { prettier, eslint },
--   javascriptreact = { prettier, eslint },
--   typescript = { prettier, eslint },
--   ['typescript.jsx'] = { prettier, eslint },
--   typescriptreact = { prettier, eslint },
--   json = { prettier },
--   lua = { stylua },
--   markdown = { prettier },
--   yaml = { prettier },
--   vue = { eslint, prettier },
-- }
--
