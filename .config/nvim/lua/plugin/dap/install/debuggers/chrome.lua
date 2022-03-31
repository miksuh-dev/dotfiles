local dbg_path = require('dap-install.config.settings').options['installation_path'] .. 'chrome/'

local adapters = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. 'vscode-chrome-debug/out/src/chromeDebug.js' },
}

local configurations = {
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
  adapters,
  configurations,
}
