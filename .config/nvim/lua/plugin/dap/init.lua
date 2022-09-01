local map = vim.keymap.set

local optsSilent = { noremap = true, silent = true }

map('n', '<Home>', function()
  require('dapui').toggle(1)
end)

map('n', '<End>', function()
  require('dapui').toggle(2)
end)

map('n', '<Leader>b', function()
  require('dap').toggle_breakpoint()
end, optsSilent)

map('n', '<Leader>B', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, optsSilent)

map('n', '<leader>dc', function()
  require('dap').continue()
end, optsSilent)

map({ 'n', 'v' }, '<Leader>dh', function()
  require('dapui').eval()
end, optsSilent)

map('n', '<leader>rc', function()
  require('dap').run_to_cursor()
end)

map('n', '<F1>', function()
  require('dap').step_over()
end, optsSilent)

map('n', '<F2>', function()
  require('dap').step_into()
end, optsSilent)

map('n', '<F3>', function()
  require('dap').step_out()
end, optsSilent)
