-- recommended session options for auto-session
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

local ignored_filetypes = {
  'neo-tree',
  'fugitive',
  'dbui',
  'help',
  'dapui_scopes',
  'dapui_breakpoints',
  'dapui_stacks',
  'dapui_watches',
  'dap-repl',
  'dap-float',
}

local ignored_directories = {
  '~/',
  '/tmp',
  'man://',
}

require('auto-session').setup({
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = ignored_directories,
  bypass_session_save_file_types = ignored_filetypes,
})
