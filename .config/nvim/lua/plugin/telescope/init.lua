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
        ['<c-v>'] = require('telescope.actions').select_vertical,
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
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        mirror = false,
        width = 0.95,
        height = 0.9,
      },
      vertical = {
        mirror = false,
        width = 0.95,
        height = 0.9,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
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

local telescope = require('telescope.builtin')
local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>ff',
  function()
    telescope.find_files()
  end,
  silent = true,
})

nnoremap({
  '<leader>fd',
  function()
    telescope.lsp_workspace_diagnostics()
  end,
  silent = true,
})

nnoremap({
  '<leader>fs',
  function()
    if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
      telescope.git_status()
    else
      print('Not a git directory')
    end
  end,
  silent = true,
})

nnoremap({
  '<leader>fg',
  function()
    telescope.live_grep()
  end,
  silent = true,
})

nnoremap({
  '<leader>fb',
  function()
    telescope.buffers()
  end,
  silent = true,
})

nnoremap({
  '<leader>fh',
  function()
    telescope.help_tags()
  end,
  silent = true,
})

nnoremap({
  '<c-p>',
  function()
    if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
      telescope.git_files()
    else
      telescope.find_files()
    end
  end,
  silent = true,
})

nnoremap({
  '<leader>fw',
  function()
    telescope.grep_string({ search = vim.fn.expand('<cword>') })
  end,
  silent = true,
})

nnoremap({
  '<leader>fW',
  function()
    telescope.grep_string({ search = vim.fn.expand('<cWORD>') })
  end,
  silent = true,
})
