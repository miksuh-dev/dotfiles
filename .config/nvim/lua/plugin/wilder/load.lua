local wilder = require('wilder')
local theme = require('theme.monokai').classic

wilder.setup({
  modes = { ':', '/', '?' },
  next_key = '<Tab>',
  previous_key = '<S-Tab>',
  accept_key = '<Down>',
  reject_key = '<Up>',
})

wilder.set_option(
  'renderer',
  wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    highlights = {
      default = wilder.make_hl('WilderDefault', '', {
        {},
        {},
        { theme.base7, theme.base2, 'nocombine' },
      }),
      accent = wilder.make_hl('WilderAccent', '', {
        {},
        {},
        { theme.white, theme.base2, 'nocombine' },
      }),
      selected = wilder.make_hl('WilderSelected', '', {
        {},
        {},
        { theme.white, theme.blue, 'bold' },
      }),
      selected_accent = wilder.make_hl('WilderSelectedAccent', '', {
        {},
        {},
        { theme.white, theme.blue, 'bold' },
      }),
    },
  })
)
