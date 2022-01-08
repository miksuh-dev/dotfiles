vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_install_gadgets = { 'vscode-firefox-debug', 'vscode-node-debug2', 'debugger-for-chrome' }
vim.g.vimspector_base_dir = vim.fn.expand('$HOME/.config/nvim/vimspector-base')

local map = vim.keymap.set

map('<Leader>dd', ':lua require("plugin.vimspector.util").launch()<CR>', { silent = true })
map('<Leader>de', ':call vimspector#Reset()<CR>')
map('<Leader>dr', '<Plug>VimspectorRestart')
map('<Leader>dc', ':call vimspector#Continue()<CR>')

map('<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>')
map('<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>')

map('<Leader>dh', '<Plug>VimspectorStepOut')
map('<Leader>dl', '<Plug>VimspectorStepInto')
map('<Leader>dj', '<Plug>VimspectorStepOver')

map({ 'n', 'x' }, '<Leader>di', '<Plug>VimspectorBalloonEval')
