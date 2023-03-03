local formatters = require('config.printer.formatters')

require('printer').setup({
  keymap = 'gp',
  behavior = 'insert_below',
  formatters = formatters,
})
