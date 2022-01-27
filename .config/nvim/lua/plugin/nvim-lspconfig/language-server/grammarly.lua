local root_dir_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  '.git',
}
local filetypes = { 'txt', 'markdown' }

return function(config)
  config.filetypes = filetypes

  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname) or vim.fn.getcwd()
  end

  return config
end
