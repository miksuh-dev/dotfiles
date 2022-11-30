local root_dir_files = {
  'Cargo.toml',
  'rust-project.json',
}

local filetypes = {
  'rust',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end
  config.filetypes = filetypes

  return config
end
