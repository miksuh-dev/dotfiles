local M = {}

function M.read(path)
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
