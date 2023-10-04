local root_dir_files = {
  'robot.yaml',
  'robotidy.toml',
  'pyproject.toml',
  '.git',
}

local filetypes = {
  'robot',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname)
  end

  config.settings = {
    python = {
      autoComplete = {
        extraPaths = { '${workspaceFolder}' },
      },
      analysis = {
        extraPaths = { '${workspaceFolder}' },
      },
    },
    robot = {
      pythonpath = { '${workspaceFolder}' },
    },
  }

  config.filetypes = filetypes

  return config
end
