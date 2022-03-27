local dbg_path = require('dap-install.config.settings').options['installation_path'] .. 'jsnode/'

local adapters = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. 'vscode-node-debug2/out/src/nodeDebug.js' },
}

local configurations = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

return {
  adapters,
  configurations,
}
