local wilder = require('wilder')

wilder.setup({
  modes = { ':', '/', '?' },
  next_key = '<Tab>',
  previous_key = '<S-Tab>',
  accept_key = '<Down>',
  reject_key = '<Up>',
})
--
wilder.set_option(
  'renderer',
  wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    -- highlights = {
    --   accent = wilder.make_hl('WilderAccent', 'Pmenu', {
    --     {},
    --     {},
    --     { theme.aqua },
    --   }),
    -- },
  })
)

-- vim.cmd([[
--   call wilder#setup({
--     \ 'modes': [':', '/', '?'],
--     \ 'next_key': '<Tab>',
--     \ 'previous_key': '<S-Tab>',
--     \ 'accept_key': '<Down>',
--     \ 'reject_key': '<Up>',
--     \ })
--
--   call wilder#set_option('renderer', wilder#popupmenu_renderer({
--     \ 'highlighter': wilder#basic_highlighter(),
--     \ 'highlights': {
--     \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
--     \ },
--     \ }))
--  ]])
