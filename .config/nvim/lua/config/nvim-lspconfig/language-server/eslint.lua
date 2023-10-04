local root_dir_files = {
  '.eslintrc.js',
  '.eslintrc',
  '.git',
}

local filetypes = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
  'graphql',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end

  config.filetypes = filetypes
  config.handlers = {
    ['eslint/noLibrary'] = function()
      vim.notify('ESLint missing from project', vim.log.levels.INFO)
      return {}
    end,
  }
  config.settings = {
    format = {
      enable = false,
    },
    run = 'onSave',
  }

  return config
end
