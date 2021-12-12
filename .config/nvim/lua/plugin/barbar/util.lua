local tree_config = require('plugin.nvim-tree.config')

local M = {}

M.collapse = function()
  require('bufferline.state').set_offset(5)
end

M.expand = function()
  require('bufferline.state').set_offset(tree_config.width + 5 + 1, tree_config.name)
end

M.conditional_collapse = function()
  if vim.bo.filetype ~= 'NvimTree' then
    M.collapse()
  end
end

M.move_to_buffer = function(tab_number)
  if vim.bo.filetype == 'NvimTree' then
    M.collapse()
  end

  if tab_number == 0 then
    return vim.cmd(':BufferLast')
  end

  return vim.cmd(':BufferGoto ' .. tab_number)
end

return M
