vim.g.indent_blankline_filetype_exclude = { 'help', 'neo-tree' }

require('indent_blankline').setup({
  show_end_of_line = false,
  show_current_context = false,
  show_current_context_start = false,
})
