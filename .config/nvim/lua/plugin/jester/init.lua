local nnoremap = vim.keymap.nnoremap

local config = {
  cmd = "jest -t '$result' -- $file", -- run command
  identifiers = { 'test', 'it' }, -- used to identify tests
  prepend = { 'describe' }, -- prepend describe blocks
  expressions = { 'call_expression' }, -- tree-sitter object used to scan for tests/describe blocks
  path_to_jest = './node_modules/bin/jest', -- used only for debugging
  terminal_cmd = ':vsplit | terminal', -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
  -- dap = { -- debug adapter configuration
  --   type = 'node2',
  --   request = 'launch',
  --   cwd = vim.fn.getcwd(),
  --   runtimeArgs = { '--inspect-brk', 'node_modules/.bin/jest', '--no-coverage', '-t', '$result', '--', '$file' },
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   skipFiles = { 'lib/**/*.js', '<node_internals>/**/*.js' },
  --   console = 'integratedTerminal',
  --   port = 9229,
  -- },
}

-- Run nearest test(s) under the cursor
nnoremap({
  '<leader>tt',
  function()
    require('jester').run(config)
  end,
  silent = true,
})

-- Run current file
nnoremap({
  '<leader>tf',
  function()
    require('jester').run_file(config)
  end,
  silent = true,
})

-- Run last test(s)
nnoremap({
  '<leader>tl',
  function()
    require('jester').run_last(config)
  end,
  silent = true,
})
