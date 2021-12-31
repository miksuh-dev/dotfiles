local function lazy_file_browser(mapping)
  local telescope = require('telescope')
  if telescope.extensions.file_browser == nil then
    telescope.load_extension('file_browser')
    return
  end

  local fb_actions = telescope.extensions.file_browser.actions
  return fb_actions[mapping]
end

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
    extensions = {
      file_browser = {
        mappings = {
          ['i'] = {
            ['<A-e>'] = lazy_file_browser('toggle_all'),
            ['<C-d>'] = lazy_file_browser('remove_file'),
            ['<C-e>'] = lazy_file_browser('create_file'),
            ['<C-f>'] = lazy_file_browser('toggle_browser'),
            ['<C-g>'] = lazy_file_browser('goto_parent_dir'),
            ['<C-h>'] = lazy_file_browser('toggle_hidden'),
            ['<C-o>'] = lazy_file_browser('open_file'),
            ['<C-r>'] = lazy_file_browser('rename_file'),
            ['<C-w>'] = lazy_file_browser('goto_cwd'),
            ['<C-y>'] = lazy_file_browser('copy_file'),
          },
          ['n'] = {
            ['dd'] = lazy_file_browser('remove_file'),
            ['e'] = lazy_file_browser('create_file'),
            ['f'] = lazy_file_browser('toggle_browser'),
            ['g'] = lazy_file_browser('goto_parent_dir'),
            ['h'] = lazy_file_browser('toggle_hidden'),
            ['m'] = lazy_file_browser('move_file'),
            ['o'] = lazy_file_browser('open_file'),
            ['r'] = lazy_file_browser('rename_file'),
            ['w'] = lazy_file_browser('goto_cwd'),
            ['y'] = lazy_file_browser('copy_file'),
          },
        },
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
        width = 0.96,
        height = 0.93,
        preview_width = 0.50,
      },
      vertical = {
        mirror = false,
        width = 0.96,
        height = 0.98,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    -- borderchars = {
    --   '▔',
    --   '▕',
    --   '▁',
    --   '▏',
    --   '🭽',
    --   '🭾',
    --   '🭿',
    --   '🭼',
    -- },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
})
