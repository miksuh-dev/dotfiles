local root_dir_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  '.git',
}

-- local eslint = require('plugin.nvim-lspconfig.efm.formatter.eslint')
local prettier = require('plugin.nvim-lspconfig.formatter.prettier')
local stylua = require('plugin.nvim-lspconfig.formatter.stylua')

local languages = {
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

-- TODO Change this to some formatting plugin (for example lsp-formatting).
return function(config)
  config.init_options = { documentFormatting = true, codeAction = true }

  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname) or vim.fn.getcwd()
  end

  config.filetypes = vim.tbl_keys(languages)
  config.settings = {
    languages = languages,
  }

  return config
end
