vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_install_gadgets = { 'vscode-firefox-debug', 'vscode-node-debug2', 'debugger-for-chrome' }
vim.g.vimspector_base_dir = vim.fn.expand('$HOME/.config/nvim/vimspector-base')

local nnoremap = vim.keymap.nnoremap
local nmap = vim.keymap.nmap
local xmap = vim.keymap.xmap

nnoremap({ '<Leader>dd', ':lua require("plugin.vimspector.util").launch()<CR>', silent = true })
-- nnoremap({ '<Leader>dd', ':call vimspector#Launch()<CR>' })
nnoremap({ '<Leader>de', ':call vimspector#Reset()<CR>' })
nmap({ '<Leader>dr', '<Plug>VimspectorRestart' })
nnoremap({ '<Leader>dc', ':call vimspector#Continue()<CR>' })

nnoremap({ '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>' })
nnoremap({ '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>' })

nmap({ '<Leader>dh', '<Plug>VimspectorStepOut' })
nmap({ '<Leader>dl', '<Plug>VimspectorStepInto' })
nmap({ '<Leader>dj', '<Plug>VimspectorStepOver' })

-- TODO Change this to lsp hover override if inside vimspector
nmap({ '<Leader>di', '<Plug>VimspectorBalloonEval' })
xmap({ '<Leader>di', '<Plug>VimspectorBalloonEval' })
