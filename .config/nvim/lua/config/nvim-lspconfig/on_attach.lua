return function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local function call_action(command)
    return '<cmd>lua require("config.nvim-lspconfig.functions").' .. command .. '()<CR>'
  end

  local opts = { noremap = true, silent = true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Goto
  buf_set_keymap('n', 'gD', call_action('declaration'), opts)
  buf_set_keymap('n', 'gd', call_action('definition'), opts)
  buf_set_keymap('n', '<leader>gd', call_action('definition_split'), opts)
  buf_set_keymap('n', 'K', call_action('hover'), opts)
  buf_set_keymap('n', 'gi', call_action('implementation'), opts)
  buf_set_keymap('n', 'gt', call_action('type_definition'), opts)
  buf_set_keymap('n', 'gr', call_action('reference'), opts)

  -- Signature help
  buf_set_keymap('n', '<c-s>', call_action('signature_help'), opts)
  buf_set_keymap('i', '<c-s>', call_action('signature_help'), opts)

  -- Rename
  buf_set_keymap('n', '<leader>rn', call_action('rename'), opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>?', call_action('diagnostics_line'), opts)

  buf_set_keymap('n', '<leader>k', call_action('goto_prev'), opts)
  buf_set_keymap('n', '<leader>j', call_action('goto_next'), opts)

  buf_set_keymap('n', '<leader>J', call_action('set_loc_list'), opts)

  -- Code actions
  buf_set_keymap('n', '<leader>a', call_action('code_action'), opts)
  buf_set_keymap('v', '<leader>a', call_action('range_code_action'), opts)

  client.server_capabilities.documentFormattingProvider = false

  -- Format on save is available
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 5000 })]])

    buf_set_keymap('n', '<leader>fo', call_action('format'), opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = 'lsp_document_highlight' })
    vim.api.nvim_create_autocmd('CursorHold', {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = 'lsp_document_highlight',
      desc = 'Document Highlight',
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = 'lsp_document_highlight',
      desc = 'Clear All the References',
    })
  end
end
