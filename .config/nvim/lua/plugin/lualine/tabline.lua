local M = {}
local util = require('common.util')

-- TODO Add too long tabline handling
local function splitFilename(strFilename)
  if strFilename:match('/') then
    local table = util.split(strFilename, '/')
    local length = util.tablelength(table)

    return table[length - 1] .. '/' .. table[length]
  end

  return strFilename
end

local function harpoon_mark_styled(index, filename)
  if vim.fn.expand('%') == filename then
    return '%#TablineSel# ' .. index .. ':' .. splitFilename(filename) .. ' %#Tabline#'
  end

  return '%#Tabline# ' .. index .. ':' .. splitFilename(filename) .. ' '
end

M.alt_file = function()
  local alternate_file = vim.fn.getreg('#')
  return alternate_file
end

M.harpoon_marks = function()
  local harpoon_marks = require('harpoon').get_mark_config().marks

  local t = {}
  for key, value in ipairs(harpoon_marks) do
    t[#t + 1] = harpoon_mark_styled(key, tostring(value.filename))
  end
  return '%#TablineFill#' .. table.concat(t, ' ')
end

return M
