local root_dir_files = {
  '.terraform',
  '.git',
}

local filetypes = {
  'terraform',
  'terraform-vars',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end

  config.filetypes = filetypes

  return config
end
