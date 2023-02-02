return function(config)
  config.handlers = {
    ['textDocument/definition'] = require('omnisharp_extended').handler,
  }

  return config
end
