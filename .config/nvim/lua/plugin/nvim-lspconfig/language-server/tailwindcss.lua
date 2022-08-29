local root_dir_files = {
  'tailwind.config.js',
  'tailwind.config.ts',
  'tailwind.config.cjs',
}

local filetypes = {
  'html',
  'css',
  'less',
  'postcss',
  'sass',
  'scss',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'vue',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end
  config.filetypes = filetypes

  return config
end
