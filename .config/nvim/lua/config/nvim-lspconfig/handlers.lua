vim.lsp.handlers['textDocument/definition'] = function(_, result)
  if not result or vim.tbl_isempty(result) then
    print('[LSP] Could not find definition')
    return
  end

  if vim.tbl_islist(result) then
    vim.lsp.util.jump_to_location(result[1], 'utf-8')
  else
    vim.lsp.util.jump_to_location(result, 'utf-8')
  end
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    source = 'always',
    spacing = 2,
  },
  update_in_insert = false,
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or require('common.border')
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
