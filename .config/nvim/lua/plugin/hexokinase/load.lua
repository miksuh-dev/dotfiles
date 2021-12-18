vim.g.Hexokinase_highlighters = { 'backgroundfull' }

vim.g.Hexokinase_optInPatterns = {
  'full_hex',
  'triple_hex',
  'rgb',
  'rgba',
  'hsl',
  'hsla',
}

-- Filetype specific patterns to match
vim.g.Hexokinase_ftOptInPatterns = {
  css = 'full_hex,rgb,rgba,hsl,hsla,colour_names',
  html = 'full_hex,rgb,rgba,hsl,hsla,colour_names',
}
