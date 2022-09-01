local dbg_path = vim.fn.stdpath('data') .. '/mason/packages'

local adapter = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. '/chrome-debug-adapter/out/src/chromeDebug.js' },
}

local configuration = {
  javascript = {
    type = 'chrome',
    reqest = 'attach',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}',
  },
  typesript = {
    type = 'chrome',
    reqest = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}',
  },
}

return {
  adapter = adapter,
  configuration = configuration,
}
