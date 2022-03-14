local util = require('common.util')

local type = {
  NORMAL = 1,
  SELECTED = 2,
  ALT = 3,
}

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

local function is_alt(filename)
  return vim.fn.getreg('#') == filename
end

local function get_text_type(filename)
  if is_selected(filename) then
    return type.SELECTED
  end

  if is_alt(filename) then
    return type.ALT
  end

  return type.NORMAL
end

local function get_styled_text(text, text_type)
  if text_type == type.SELECTED then
    return '%#TablineSel#' .. text .. '%#Tabline#'
  end

  if text_type == type.ALT then
    return ' %#TabLineAltFile#' .. text .. '%#Tabline# '
  end

  return '%#Tabline#' .. text
end

local function get_text_content(index, text, text_type)
  if text_type == type.ALT then
    return '' .. index .. ':' .. text .. ''
  end

  return ' ' .. index .. ':' .. text .. ' '
end

-- TODO Add counter of overflowed marks
return function()
  local harpoon_marks = require('harpoon').get_mark_config().marks
  -- local num_of_marks = util.tablelength(harpoon_marks)

  local t = {}
  local length = vim.api.nvim_list_uis()[1].width

  for key, value in ipairs(harpoon_marks) do
    local filename = value.filename

    local current_type = get_text_type(filename)
    local text = get_text_content(key, shorten_filename(filename), current_type)

    -- Prevent overflow
    if length - #text <= 0 then
      -- if (type == type.ALT and length - #text - 2 <= 0) or length - #text - 2 <= 0 then
      break
    else
      length = length - #text - 2
    end

    t[#t + 1] = get_styled_text(text, current_type)
  end

  return '%#TablineFill#' .. table.concat(t, ' ')
end
