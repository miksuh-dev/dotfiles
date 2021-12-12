vim.cmd("autocmd BufWinEnter dbui lua require('plugin.barbar.util').expand('dbui')")
vim.cmd("autocmd BufWinLeave dbui lua require('plugin.barbar.util').collapse('dbui')")
