local border = require('common.border')

vim.g.coq_settings = {
  auto_start = 'shut-up',
  ['keymap.recommended'] = false,
  ['display.preview.border'] = border,
  ['keymap.jump_to_mark'] = '<C-e>',
  ['display.preview.positions'] = { east = 1, south = 2, north = 3, west = 4 },
  ['keymap.pre_select'] = true,
  ['display.pum.source_context'] = { '[', ']' },
  ['display.icons.mode'] = 'none',
}
