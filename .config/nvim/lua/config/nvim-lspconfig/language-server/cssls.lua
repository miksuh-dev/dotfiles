local root_dir_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  '.git',
}

local filetypes = {
  'css',
  'scss',
  'less',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end
  config.settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  }
  config.filetypes = filetypes

  return config
end
