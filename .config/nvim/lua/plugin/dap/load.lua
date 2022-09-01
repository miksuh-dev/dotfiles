local dap = require('dap')
local jsnode = require('plugin.dap.debuggers.jsnode')
local firefox = require('plugin.dap.debuggers.firefox')
-- local chrome = require('plugin.dap.debuggers.chrome')

dap.configurations.javascript = { firefox.configuration }
dap.configurations.typescript = { jsnode.configuration }
dap.configurations.typescriptreact = { firefox.configuration }

dap.adapters[jsnode.configuration.type] = jsnode.adapter
dap.adapters[firefox.configuration.type] = firefox.adapter

dap.listeners.after.event_initialized['dapui_config'] = function()
  require('dapui').open(1)
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  require('dapui').close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  require('dapui').close()
end
