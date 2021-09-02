-- Copyright (c) 2020-2021 miksuh
-- MIT license, see LICENSE for more details.
-- LuaFormatter off
local Colors = {
  white          = '#ffffff',
  darkestgreen   = '#005f00',
  normalbg       = '#4682b4',
  darkestcyan    = '#005f5f',
  insertbg       = '#87AF5F',
  darkestblue    = '#005f87',
  darkred        = '#870000',
  replacebg      = '#870000',
  visualbg       = '#ff8c00',
  gray0          = '#1C1C1C',
  gray1          = '#262626',
  gray2          = '#272727',
  gray4          = '#585858',
  gray5          = '#3f3f3f',
  gray7          = '#9e9e9e',
  gray10         = '#f0f0f0',
}
-- LuaFormatter on
return {
  normal = {
    a = {fg = Colors.white, bg = Colors.normalbg, gui = 'bold'},
    b = {fg = Colors.gray10, bg = Colors.gray2},
    c = {fg = Colors.gray7, bg = Colors.gray0}
  },
  insert = {
    a = {fg = Colors.white, bg = Colors.insertbg, gui = 'bold'},
    b = {fg = Colors.gray10, bg = Colors.gray2},
    c = {fg = Colors.gray7, bg = Colors.gray0}
  },
  visual = {a = {fg = Colors.white, bg = Colors.visualbg, gui = 'bold'}},
  replace = {a = {fg = Colors.white, bg = Colors.replacebg, gui = 'bold'}},
  inactive = {
    a = {fg = Colors.gray1, bg = Colors.gray5, gui = 'bold'},
    b = {fg = Colors.gray1, bg = Colors.gray5},
    c = {bg = Colors.gray1, fg = Colors.gray5}
  }
}
