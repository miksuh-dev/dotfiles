local M = {}

local function buffer_with_attribute_exists(bufferlist, attribute)
  for _, buffer in ipairs(bufferlist) do
    if buffer[attribute] == 1 then
      return true
    end
  end
end

M.toggle_quickfix_list = function()
  local active_buffers = vim.fn.getwininfo()
  if buffer_with_attribute_exists(active_buffers, 'quickfix') then
    return vim.cmd('cclose')
  end

  local quickfix_list = vim.fn.getqflist()

  if next(quickfix_list) ~= nil then
    return vim.cmd('copen')
  end

  print('No quickfix list')
end

M.toggle_location_list = function()
  local active_buffers = vim.fn.getwininfo()
  if buffer_with_attribute_exists(active_buffers, 'loclist') then
    return vim.cmd('lclose')
  end

  if not pcall(vim.cmd, 'lopen') then
    print('No location list  ')
  end
end

return M
