vim.g.indent_blankline_filetype_exclude = { 'help', 'neo-tree' }

local highlight = {
  'IndentBlanklineChar',
}

local scope_highlight = {
  'IndentBlanklineCharScope',
}

require('ibl').setup({
  indent = { highlight = highlight, char = '│' },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { highlight = scope_highlight, enabled = true },
})
