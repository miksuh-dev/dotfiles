local util = require('common.util')
local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>ff',
  function()
    require('telescope.builtin').find_files({
      hidden = true,
    })
  end,
  silent = true,
})

nnoremap({
  '<leader>fd',
  function()
    require('telescope.builtin').lsp_workspace_diagnostics()
  end,
  silent = true,
})

nnoremap({
  '<leader>fs',
  function()
    if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0 then
      require('telescope.builtin').git_status()
    else
      print('Not a git directory')
    end
  end,
  silent = true,
})

nnoremap({
  '<leader>fg',
  function()
    require('telescope.builtin').live_grep()
  end,
  silent = true,
})

nnoremap({
  '<leader>fb',
  function()
    require('telescope.builtin').buffers()
  end,
  silent = true,
})

nnoremap({
  '<leader>fh',
  function()
    require('telescope.builtin').help_tags()
  end,
  silent = true,
})

nnoremap({
  '<c-p>',
  function()
    if util.is_directory(vim.fn.getcwd() .. '/.git') then
      require('telescope.builtin').git_files()
    else
      require('telescope.builtin').find_files()
    end
  end,
  silent = true,
})

nnoremap({
  '<leader>fw',
  function()
    require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
  end,
  silent = true,
})

nnoremap({
  '<leader>fW',
  function()
    require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
  end,
  silent = true,
})
