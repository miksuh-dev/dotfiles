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
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == 'file' and vim.loop.fs_access(path, 'R')
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

return M
