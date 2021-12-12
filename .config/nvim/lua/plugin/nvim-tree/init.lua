local util = require('common.util')
local barbar_util = require('plugin.barbar.util')

local function in_db_ui(filetype)
  return filetype == 'sql' or filetype == 'dbout'
end

local nnoremap = vim.keymap.nnoremap

-- TODO Fix collapse/expand with dadbod-ui
nnoremap({
  '<leader>n',
  function()
    local fn = vim.fn
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      barbar_util.collapse()
      require('nvim-tree').close()
    elseif filetype == 'dbui' then
      vim.cmd(':DBUIToggle')
    elseif in_db_ui(filetype) then
      vim.cmd(':DBUI')
    elseif util.is_file(fn.expand('%')) then
      barbar_util.expand()
      require('nvim-tree').find_file(true)
    else
      barbar_util.expand()
      require('nvim-tree').focus()
    end
  end,
})

nnoremap({
  '<leader>N',
  function()
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      barbar_util.collapse()
      require('nvim-tree').close()
    else
      require('nvim-tree').focus()
    end
  end,
})
