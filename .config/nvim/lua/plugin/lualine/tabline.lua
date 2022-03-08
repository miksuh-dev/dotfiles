local M = {}

local function harpoon_mark_styled(index, filename)
  return index .. '. ' .. filename
end

M.alt_file = function()
  local alternate_file = vim.fn.getreg('#')
  return alternate_file
end

M.harpoon_marks = function()
  local loaded = require('common.util').is_plugin_loaded('harpoon')

  if loaded then
    local harpoon_marks = require('harpoon').get_mark_config().marks

    local t = {}
    for key, value in ipairs(harpoon_marks) do
      t[#t + 1] = harpoon_mark_styled(key, tostring(value.filename))
    end
    return table.concat(t, ' | ')
  end

  return ''
end

return M
