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
        ['<c-o>'] = require('telescope.actions').select_vertical,
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

function _G.find_files()
  require('telescope.builtin').find_files()
end

function _G.workspace_diagnostics()
  require('telescope.builtin').lsp_workspace_diagnostics()
end

function _G.git_status()
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
    require('telescope.builtin').git_status()
  else
    print('Not a git directory')
  end
end

function _G.live_grep()
  require('telescope.builtin').live_grep()
end

function _G.buffers()
  require('telescope.builtin').buffers()
end

function _G.help_tags()
  require('telescope.builtin').help_tags()
end

-- Use git_files if available else use find_files
function _G.git_files_or_find_files()
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
    require('telescope.builtin').git_files()
  else
    find_files()
  end
end

function _G.find_word(whole_word)
  if whole_word then
    require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
  else
    require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
  end
end

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua find_files()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>lua workspace_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua git_status()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua live_grep()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua buffers()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua help_tags<CR>', opts)

vim.api.nvim_set_keymap('n', '<c-p>', '<Cmd>lua git_files_or_find_files()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>lua find_word()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fW', '<cmd>lua find_word(1)<CR>', opts)
