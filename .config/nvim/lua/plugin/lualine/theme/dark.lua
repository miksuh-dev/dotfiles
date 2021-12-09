-- local main_color = dofile('/home/miksuh/.config/colors/main')
-- local file = require('common.file')
-- local main_color = file.read(os.getenv('HOME') .. '/.config/colors/main')

local Colors = {
  white = '#ffffff',
  normalbg = '#1793d0',
  insertbg = '#a6e22e',
  replacebg = '#e95678',
  visualbg = '#fd971f',
  gray0 = '#1C1C1C',
  gray1 = '#262626',
  gray2 = '#272727',
  gray4 = '#585858',
  gray5 = '#3f3f3f',
  gray7 = '#9e9e9e',
  gray10 = '#f0f0f0',
  none = 'NONE',
}

return {
  normal = {
    a = { fg = Colors.white, bg = Colors.normalbg, gui = 'bold' },
    b = { fg = Colors.gray10, bg = Colors.none },
    c = { fg = Colors.gray10, bg = Colors.none },
  },
  insert = {
    a = { fg = Colors.white, bg = Colors.insertbg, gui = 'bold' },
    b = { fg = Colors.gray10, bg = Colors.none },
    c = { fg = Colors.gray10, bg = Colors.none },
  },
  visual = { a = { fg = Colors.white, bg = Colors.visualbg, gui = 'bold' } },
  replace = { a = { fg = Colors.white, bg = Colors.replacebg, gui = 'bold' } },
  inactive = {
    a = { fg = Colors.gray7, bg = Colors.gray5, gui = 'bold' },
    b = { fg = Colors.gray7, bg = Colors.none },
    c = { fg = Colors.gray7, bg = Colors.none },
  },
}
