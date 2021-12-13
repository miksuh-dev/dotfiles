local util = require('common.util')

local function in_db_ui(filetype)
  return filetype == 'sql' or filetype == 'dbout'
end

local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>n',
  function()
    if vim.bo.filetype == 'NvimTree' then
      return require('nvim-tree').close()
    end

    if vim.bo.filetype == 'dbui' then
      return vim.cmd(':DBUIToggle')
    end

    if in_db_ui(vim.bo.filetype) then
      return vim.cmd(':DBUI')
    end

    if util.is_file(vim.fn.expand('%')) then
      return require('nvim-tree').find_file(true)
    end

    return require('nvim-tree').focus()
  end,
})

nnoremap({
  '<leader>N',
  function()
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      return require('nvim-tree').close()
    end

    return require('nvim-tree').focus()
  end,
})
