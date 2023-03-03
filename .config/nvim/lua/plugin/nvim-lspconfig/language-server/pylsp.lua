local filetypes = {
  'python',
}

return function(config)
  config.filetypes = filetypes

  config.settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100,
        },
      },
    },
  }

  return config
end
