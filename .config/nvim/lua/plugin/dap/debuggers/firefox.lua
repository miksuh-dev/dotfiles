local dbg_path = vim.fn.stdpath('data') .. '/mason/packages'

local adapter = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. '/firefox-debug-adapter/dist/adapter.bundle.js' },
}

local configuration = {
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/usr/bin/firefox',
}

return {
  adapter = adapter,
  configuration = configuration,
}
