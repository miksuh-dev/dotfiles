local json_schemas = require('schemastore').json.schemas({})

local yaml_schemas = {}
vim.tbl_map(function(schema)
  yaml_schemas[schema.url] = schema.fileMatch
end, json_schemas)

return function(config)
  config.settings = {
    yaml = {
      schemas = yaml_schemas,
    },
  }

  return config
end
