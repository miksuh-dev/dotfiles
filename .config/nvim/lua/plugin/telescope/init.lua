local util = require('common.util')
local map = vim.keymap.set

map('n', '<leader>ff', function()
  require('telescope.builtin').find_files({
    hidden = true,
  })
end, {
  silent = true,
})

map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, {
  silent = true,
})

map('n', '<leader>fd', function()
  require('telescope.builtin').diagnostics()
end, { silent = true })

map('n', '<leader>fs', function()
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
    require('telescope.builtin').git_status()
  else
    print('Not a git directory')
  end
end, {
  silent = true,
})

map('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, { silent = true })

map('n', '<leader>fb', function()
  require('telescope.builtin').buffers()
end, { silent = true })

map('n', '<leader>fh', function()
  require('telescope.builtin').help_tags()
end, { silent = true })

map('n', '<c-p>', function()
  if util.is_directory(vim.fn.getcwd() .. '/.git') then
    require('telescope.builtin').git_files()
  else
    require('telescope.builtin').find_files({ hidden = true })
  end
end, {
  silent = true,
})

map('n', '<leader>fw', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
end, {
  silent = true,
})

map('n', '<leader>fW', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
end, {
  silent = true,
})

map('n', '<leader>hl', function()
  require('telescope.builtin').highlights()
end, { silent = true })
