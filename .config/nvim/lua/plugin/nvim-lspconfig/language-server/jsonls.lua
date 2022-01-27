return function(config)
  config.settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  }

  return config
end
