local M = {}

M.declaration = function()
  vim.lsp.buf.declaration()
end

M.definition = function()
  vim.lsp.buf.definition()
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

M.diagnostics_line = function()
  vim.diagnostic.open_float(0, { scope = 'line' })
end

M.goto_prev = function()
  vim.diagnostic.goto_prev({
    wrap = false,
  })
end

M.goto_next = function()
  vim.diagnostic.goto_next({
    wrap = false,
  })
end

M.set_loc_list = function()
  vim.diagnostic.setloclist()
end

M.code_action = function()
  -- Make sure telescope is loaded
  -- TODO: Find a better way to do this
  require('telescope')

  vim.lsp.buf.code_action()
end

M.range_code_action = function()
  vim.lsp.buf.range_code_action()
end

M.format = function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end

M.range_format = function()
  vim.lsp.buf.range_formatting({ timeout_ms = 5000 })
end

M.rename = function()
  vim.lsp.buf.rename()
end

return M
