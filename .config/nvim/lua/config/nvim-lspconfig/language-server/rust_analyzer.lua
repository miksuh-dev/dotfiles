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

  config.settings = {
    rust = {
      unstable_features = true,
      build_on_save = true,
      all_features = true,
      proc_macro = {
        enable = true,
      },
    },
  }

  config.filetypes = filetypes

  return config
end
