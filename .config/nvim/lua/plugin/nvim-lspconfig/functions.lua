local M = {}

M.declaration = function()
  vim.lsp.buf.declaration()
end

M.definition = function()
  require('telescope.builtin').lsp_definitions({ file_ignore_patterns = {} })
end

M.hover = function()
  vim.lsp.buf.hover()
end

M.implementation = function()
  require('telescope.builtin').lsp_implementations({ file_ignore_patterns = {} })
end

M.type_definition = function()
  require('telescope.builtin').lsp_type_definitions({ file_ignore_patterns = {} })
end

M.reference = function()
  require('telescope.builtin').lsp_references({ file_ignore_patterns = {} })
end

M.signature_help = function()
  vim.lsp.buf.signature_help()
end

M.rename = function()
  vim.lsp.buf.rename()
end

M.diagnostics_line = function()
  vim.diagnostic.open_float(0, { scope = 'line' })
end

M.goto_prev = function()
  vim.lsp.diagnostic.goto_prev({
    wrap = false,
  })
end

M.goto_next = function()
  vim.lsp.diagnostic.goto_next({
    wrap = false,
  })
end

M.set_loc_list = function()
  vim.diagnostic.setloclist()
end

M.code_action = function()
  require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))
end

M.range_code_action = function()
  require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))
end

M.format = function()
  vim.lsp.buf.formatting({ timeout_ms = 5000 })
end

M.range_format = function()
  vim.lsp.buf.range_formatting({ timeout_ms = 5000 })
end

return M
