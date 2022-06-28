local path = vim.fn.stdpath('config') .. '/lua'
local files = io.popen('find ' .. path .. '/plugin/*/init.lua -type f')

if not files then
  return
end

for file_path in files:lines() do
  local file = file_path
    :sub(
      #path + 2, -- +2 to remove the '/'
      #file_path - 4 -- -4 to remove the extension
    )
    :gsub('/', '.')

  local success, _ = pcall(require, file)
  if not success then
    print('Failed to load ' .. file)
  end
end
