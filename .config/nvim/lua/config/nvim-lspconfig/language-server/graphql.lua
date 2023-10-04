local root_dir_files = {
  'graphql.config.json',
  'graphql.config.ts',
  'graphql.config.js',
  '.git',
}

local filetypes = { 'graphql', 'typescriptreact', 'typescript' }

return function(config)
  config.filetypes = filetypes
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname) or vim.fn.getcwd()
  end

  return config
end
