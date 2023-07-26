local M = {}

-- Check if vim has opt
M.has = function(x)
  return vim.fn.has(x) == 1
end

-- Is executable command
M.executable = function(x)
  return vim.fn.executable(x) == 1
end

-- File exists
-- Note: Remember to append path to filename e.x. is_file(vim.fn.getcwd() .. '/plugins.lua')
M.is_file = function(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.type == 'file' and vim.uv.fs_access(path, 'R')
end

-- Directory exists
-- Note: Remember to append path to filename e.x. is_directory(vim.fn.getcwd() .. '/.git')
M.is_directory = function(path)
  return vim.fn.isdirectory(path) ~= 0
end

-- Check if table contains value
M.has_value = function(table, value)
  for _, val in ipairs(table) do
    if value == val then
      return true
    end
  end

  return false
end

M.is_plugin_loaded = function(plugin_name)
  return package.loaded[plugin_name]
end

M.read_file = function(path)
  local file = io.open(path, 'rb') -- r read mode and b binary mode
  if not file then
    return nil
  end
  local content = file:read('*a') -- *a or *all reads the whole file
  file:close()
  -- return content
  return string.gsub(content, '\n', '') -- remove line breaks
end

---Convert a hex color to an rgb color
---@param color string
---@return number
---@return number
---@return number
local function to_rgb(color)
  return tonumber(color:sub(2, 3), 16), tonumber(color:sub(4, 5), 16), tonumber(color:sub(6), 16)
end

M.split = function(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
    table.insert(result, match)
  end
  return result
end

M.shade_color = function(color, percent)
  local r, g, b = to_rgb(color)
  if not r or not g or not b then
    return 'NONE'
  end
  r = math.floor(tonumber(r * (100 + percent) / 100))
  g = math.floor(tonumber(g * (100 + percent) / 100))
  b = math.floor(tonumber(b * (100 + percent) / 100))
  r, g, b = r < 255 and r or 255, g < 255 and g or 255, b < 255 and b or 255

  r, g, b = string.format('%0x', r), string.format('%0x', g), string.format('%0x', b)
  return '#' .. r .. g .. b
end

return M
