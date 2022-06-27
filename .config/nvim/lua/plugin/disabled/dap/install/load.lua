local util = require('common.util')
local required_debuggers = require('plugin.dap.install.required_debuggers')

local dap_install = require('dap-install')
local installed_debuggers = require('dap-install.api.debuggers').get_installed_debuggers()

for _, debugger in ipairs(required_debuggers) do
  local installed = util.has_value(installed_debuggers, debugger)

  if installed then
    local success, config = pcall(require, 'plugin.dap.install.debuggers.' .. debugger)

    if success then
      dap_install.config(debugger, config)
    end
  else -- Install missing
    require('dap-install.core.install').install_debugger(debugger)
  end
end
