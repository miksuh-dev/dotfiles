local dbg_path = vim.fn.stdpath('data') .. '/mason/packages'

local adapter = {
  type = 'executable',
  command = 'node',
  args = { dbg_path .. '/node-debug2-adapter/out/src/nodeDebug.js' },
}

local configuration = {
  type = 'node2',
  request = 'launch',
  program = '${workspaceFolder}/${file}',
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = 'inspector',
  console = 'integratedTerminal',
}

return {
  adapter = adapter,
  configuration = configuration,
}
