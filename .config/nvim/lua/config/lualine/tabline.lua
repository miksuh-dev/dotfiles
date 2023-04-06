local util = require('common.util')

local type = {
  NORMAL = 1,
  SELECTED = 2,
  ALT = 3,
}

local function shorten_filename(path)
  if path:match('/') then
    local table = util.split(path, '/')
    local length = vim.fn.len(table)

    return table[length - 1] .. '/' .. table[length]
  end

  return path
end

local function is_selected(filename)
  local current_filename = vim.api.nvim_buf_get_name(0)

  return filename == current_filename or vim.loop.cwd() .. '/' .. filename == current_filename
end

local function is_alt(filename)
  local full_filename = vim.loop.cwd() .. '/' .. filename
  local alt_filename = vim.loop.cwd() .. '/' .. vim.fn.getreg('#')

  return full_filename == alt_filename
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
    return index .. ':' .. text
  end

  return ' ' .. index .. ':' .. text .. ' '
end

local function fill_space(count)
  local text = ''
  for _ = 0, count do
    text = text .. ' '
  end
  return text
end

local function get_count_text(current, total)
  local diff = total - current
  if diff > 0 then
    return total - current .. '+'
  end

  return ''
end

return function()
  local harpoon_marks = require('harpoon').get_mark_config().marks
  local num_of_marks = vim.fn.len(harpoon_marks)

  if num_of_marks == 0 then
    return ''
  end

  local t = {}
  local length = vim.api.nvim_list_uis()[1].width

  local count_text = ''
  for key, value in ipairs(harpoon_marks) do
    local filename = value.filename

    local current_type = get_text_type(filename)
    local text = get_text_content(key, shorten_filename(filename), current_type)
    local text_length = current_type == type.ALT and #text + 2 or #text
    local local_count_text = get_count_text(key, num_of_marks)

    -- Prevent overflow
    if length - text_length - #count_text < key then
      break
    end

    length = length - text_length
    count_text = local_count_text

    t[#t + 1] = get_styled_text(text, current_type)
  end

  length = length - vim.fn.len(t)

  local fill_char_count = length - #count_text

  return '%#TablineFill#' .. table.concat(t, ' ') .. fill_space(fill_char_count) .. count_text
end
