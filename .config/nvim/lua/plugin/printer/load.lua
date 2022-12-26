local formatters = require('plugin.printer.formatters')

require('printer').setup({
  keymap = 'gp',
  behavior = 'insert_below',
  formatters = formatters,
})
