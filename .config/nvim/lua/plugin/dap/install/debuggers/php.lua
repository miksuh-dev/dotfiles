local dbg_path = require('dap-install.config.settings').options['installation_path'] .. 'php/'

local adapters = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. 'vscode-php-debug/out/phpDebug.js' },
}

local configurations = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
  },
}

return {
  adapters,
  configurations,
}
