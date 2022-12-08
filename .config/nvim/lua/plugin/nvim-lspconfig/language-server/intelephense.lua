local filetypes = {
  'php',
  'blade',
}

return function(config)
  config.filetypes = filetypes

  return config
end
