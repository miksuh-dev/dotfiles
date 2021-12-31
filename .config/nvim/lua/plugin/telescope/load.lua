local fb_actions = require('telescope').extensions.file_browser.actions

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
            ['<A-e>'] = fb_actions.toggle_all,
            ['<C-d>'] = fb_actions.remove_file,
            ['<C-e>'] = fb_actions.create_file,
            ['<C-f>'] = fb_actions.toggle_browser,
            ['<C-g>'] = fb_actions.goto_parent_dir,
            ['<C-h>'] = fb_actions.toggle_hidden,
            ['<C-o>'] = fb_actions.open_file,
            ['<C-r>'] = fb_actions.rename_file,
            ['<C-w>'] = fb_actions.goto_cwd,
            ['<C-y>'] = fb_actions.copy_file,
          },
          ['n'] = {
            ['dd'] = fb_actions.remove_file,
            ['e'] = fb_actions.create_file,
            ['f'] = fb_actions.toggle_browser,
            ['g'] = fb_actions.goto_parent_dir,
            ['h'] = fb_actions.toggle_hidden,
            ['m'] = fb_actions.move_file,
            ['o'] = fb_actions.open_file,
            ['r'] = fb_actions.rename_file,
            ['w'] = fb_actions.goto_cwd,
            ['y'] = fb_actions.copy_file,
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
