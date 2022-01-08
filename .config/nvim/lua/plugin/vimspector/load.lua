vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_install_gadgets = { 'vscode-firefox-debug', 'vscode-node-debug2', 'debugger-for-chrome' }
vim.g.vimspector_base_dir = vim.fn.expand('$HOME/.config/nvim/vimspector-base')

local set = vim.keymap.set

set('<Leader>dd', ':lua require("plugin.vimspector.util").launch()<CR>', { silent = true })
set('<Leader>de', ':call vimspector#Reset()<CR>')
set('<Leader>dr', '<Plug>VimspectorRestart')
set('<Leader>dc', ':call vimspector#Continue()<CR>')

set('<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>')
set('<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>')

set('<Leader>dh', '<Plug>VimspectorStepOut')
set('<Leader>dl', '<Plug>VimspectorStepInto')
set('<Leader>dj', '<Plug>VimspectorStepOver')

set({ 'n', 'x' }, '<Leader>di', '<Plug>VimspectorBalloonEval')
