return function(config)
  config.handlers = {
    ['eslint/noLibrary'] = function()
      vim.notify('ESLint missing from project', vim.log.levels.INFO)
      return {}
    end,
  }
  config.settings = {
    format = {
      enable = false, -- in case of eslint error change this to true
    },
    run = 'onSave',
  }

  return config
end
