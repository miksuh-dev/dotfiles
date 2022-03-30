require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      '.git/.*',
      'node_modules/.*',
    },
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<c-s>'] = require('telescope.actions').select_horizontal,
        ['<tab>'] = require('telescope.actions').select_vertical,
        ['<c-q>'] = require('telescope.actions').send_to_qflist,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = {
        mirror = false,
        width = { padding = 1 },
        height = { padding = 0 },
        preview_width = 0.50,
      },
      vertical = {
        mirror = false,
        width = { padding = 1 },
        height = { padding = 0 },
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case', -- this is default
    },
  },
})

require('telescope').load_extension('fzf')
