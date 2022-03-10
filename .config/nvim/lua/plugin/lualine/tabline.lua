local M = {}
local util = require('common.util')

local function shorten_filename(path)
  if path:match('/') then
    local table = util.split(path, '/')
    local length = util.tablelength(table)

    return table[length - 1] .. '/' .. table[length]
  end

  return path
end

local function is_selected(filename)
  return vim.fn.expand('%') == filename
end

local function get_styled_text(filename, text)
  if is_selected(filename) then
    return '%#TablineSel#' .. text .. '%#Tabline#'
  end
  return '%#Tabline#' .. text
end

local function get_text_content(index, text)
  return ' ' .. index .. ':' .. text .. ' '
end

M.alt_file = function()
  local alternate_file = vim.fn.getreg('#')
  return alternate_file
end

M.harpoon_marks = function()
  local harpoon_marks = require('harpoon').get_mark_config().marks

  local t = {}
  local window_width = vim.api.nvim_list_uis()[1].width

  local length = 0
  for key, value in ipairs(harpoon_marks) do
    local filename = value.filename
    local text = get_text_content(key, shorten_filename(filename))

    -- Prevent overflow
    length = length + #text
    if length >= window_width then
      break
    end

    t[#t + 1] = get_styled_text(filename, text)
  end
  return '%#TablineFill#' .. table.concat(t, ' ')
end

return M
