require('compe').setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 400,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { '', '', '', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnips = true,
    luasnip = true,
    tabnine = {
      max_line = 1000,
      max_num_results = 6,
      priority = 5000,
      sort = false,
      show_prediction_strength = true,
      ignore_pattern = '',
    },
  },
})

-- Compe
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap(
  'i',
  '<CR>',
  [[ compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()")) ]],
  { noremap = true, silent = true, expr = true }
)
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({"delta": +4})', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({"delta": -6})', { noremap = true, silent = true, expr = true })
