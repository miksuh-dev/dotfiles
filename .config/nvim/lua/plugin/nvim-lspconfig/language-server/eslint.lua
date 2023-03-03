local root_dir_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  'jsconfig.json',
  '.eslintrc',
  '.git',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end

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
    run = 'onType',
  }

  return config
end
