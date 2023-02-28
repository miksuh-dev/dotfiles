local filetypes = {
  'html',
  'blade',
}

return function(config)
  config.filetypes = filetypes

  return config
end
