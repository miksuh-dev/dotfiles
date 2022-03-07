local colors = require('theme.monokai').classic

return {
  normal = {
    a = { fg = colors.white, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.white, bg = colors.none },
    x = { fg = colors.white, bg = colors.none },
    y = { fg = colors.white, bg = colors.none },
    z = { fg = colors.white, bg = colors.none },
  },
  insert = {
    a = { fg = colors.white, bg = colors.green, gui = 'bold' },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.white, bg = colors.none },
    x = { fg = colors.white, bg = colors.none },
    y = { fg = colors.white, bg = colors.none },
    z = { fg = colors.white, bg = colors.none },
  },
  visual = {
    a = { fg = colors.white, bg = colors.orange, gui = 'bold' },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.white, bg = colors.none },
    x = { fg = colors.white, bg = colors.none },
    y = { fg = colors.white, bg = colors.none },
    z = { fg = colors.white, bg = colors.none },
  },
  replace = {
    a = { fg = colors.white, bg = colors.red, gui = 'bold' },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.white, bg = colors.none },
    x = { fg = colors.white, bg = colors.none },
    y = { fg = colors.white, bg = colors.none },
    z = { fg = colors.white, bg = colors.none },
  },
  command = {
    a = { fg = colors.white, bg = colors.aqua, gui = 'bold' },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.white, bg = colors.none },
    x = { fg = colors.white, bg = colors.none },
    y = { fg = colors.white, bg = colors.none },
    z = { fg = colors.white, bg = colors.none },
  },
  inactive = {
    a = { fg = colors.base7, bg = colors.base4, gui = 'bold' },
    b = { fg = colors.base7, bg = colors.none },
    c = { fg = colors.base7, bg = colors.none },
    x = { fg = colors.base7, bg = colors.none },
    y = { fg = colors.base7, bg = colors.none },
    z = { fg = colors.base7, bg = colors.none },
  },
}
