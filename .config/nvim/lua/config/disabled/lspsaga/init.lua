local saga = require('lspsaga')
saga.init_lsp_saga({
  rename_action_keys = {
    quit = '<ESC>',
    exec = '<CR>',
  },
  code_action_keys = {
    quit = '<ESC>',
    exec = '<CR>',
  },
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
  use_saga_diagnostic_sign = false,
  -- error_sign = "",
  -- warn_sign = "",
  -- hint_sign = "",
  -- infor_sign = "✘",
  dianostic_header_icon = '',
  definition_preview_icon = '',
  code_action_icon = '',
  rename_prompt_prefix = 'Rename:',
})

vim.cmd([[
  highlight default LspSagaDiagnosticBorder guifg=#7739e3 guibg=NONE
  highlight default LspSagaDiagnosticHeader guifg=#d8a657 guibg=NONE gui=bold
  highlight default LspSagaDiagnosticTruncateLine guifg=#7739e3 guibg=NONE
  highlight default LspDiagnosticsFloatingError guifg=#EC5f67 guibg=NONE
  highlight default LspDiagnosticsFloatingWarn guifg=#d8a657 guibg=NONE
  highlight default LspDiagnosticsFloatingInfor guifg=#6699cc guibg=NONE
  highlight default LspDiagnosticsFloatingHint guifg=#56b6c2 guibg=NONE

  highlight default LspSagaShTruncateLine guifg=black guibg=NONE
  highlight default LspSagaDocTruncateLine guifg=black guibg=NONE
  highlight default LspSagaCodeActionTitle guifg=#da8548 guibg=NONE gui=bold
  highlight default LspSagaCodeActionTruncateLine guifg=black guibg=NONE

  highlight default LspSagaCodeActionContent guifg=#98be65 guibg=NONE gui=bold

  highlight default LspSagaRenamePromptPrefix guifg=#98be65 guibg=NONE

  highlight default LspSagaRenameBorder guifg=#3bb6c4 guibg=NONE
  highlight default LspSagaHoverBorder guifg=#80A0C2 guibg=NONE
  highlight default LspSagaSignatureHelpBorder guifg=#98be65 guibg=NONE
  highlight default LspSagaLspFinderBorder guifg=#51afef guibg=NONE
  highlight default LspSagaCodeActionBorder guifg=#b3deef guibg=NONE
  highlight default LspSagaAutoPreview guifg=#ECBE7B guibg=NONE
  highlight default LspSagaDefPreviewBorder guifg=#b3deef guibg=NONE
]])

local optsSilent = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', optsSilent)
vim.api.nvim_set_keymap('v', '<leader>a', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', optsSilent)

vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', optsSilent)

vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', optsSilent)

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', optsSilent)

vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', optsSilent)

vim.api.nvim_set_keymap(
  'n',
  '<leader>k',
  '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev({ wrap = false })<CR>',
  optsSilent
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>j',
  '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next({ wrap = false })<CR>',
  optsSilent
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>?',
  '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>',
  optsSilent
)
