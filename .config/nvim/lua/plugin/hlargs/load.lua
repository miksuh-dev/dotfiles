local colors = require('theme.monokai').classic

require('hlargs').setup({
  color = colors.orange,
  excluded_filetypes = {},
  paint_arg_declarations = true,
  paint_arg_usages = true,
  performance = {
    parse_delay = 1,
    max_iterations = 400,
  },
})
