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
      autoComplete = {
        extraPaths = { '${workspaceFolder}' },
      },
      analysis = {
        extraPaths = { '${workspaceFolder}' },
      },
    },
  }

  return config
end
