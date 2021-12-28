-- recommended session options for auto-session
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

local opts = {
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = { '~/' },
}

require('auto-session').setup(opts)
