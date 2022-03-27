local map = vim.keymap.set

-- TODO Change this to silent, when done with dap setup
local optsSilent = { noremap = true }

map('n', '<Leader>dc', function()
  require('dap').continue()
end, optsSilent)

map('n', '<Leader>dsv', function()
  require('dap').step_over()
end, optsSilent)

map('n', '<Leader>dsi', function()
  require('dap').step_into()
end, optsSilent)

map('n', '<Leader>dso', function()
  require('dap').step_out()
end, optsSilent)

map({ 'n', 'v' }, '<Leader>dh', function()
  require('dapui').eval()
end, optsSilent)

map('n', '<Leader>drt', function()
  require('dap').repl.toggle()
end, optsSilent)

map('n', '<Leader>dbc', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, optsSilent)

map('n', '<Leader>dbm', function()
  require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })
end, optsSilent)

map('n', '<Leader>dbt', function()
  require('dap').toggle_breakpoint()
end, optsSilent)

map('n', '<Leader>dbb', function()
  require('dapui').toggle()
end, optsSilent)

map('n', '<Leader>dbl', function()
  require('telescope').extensions.dap.list_breakpoints({})
end, optsSilent)
