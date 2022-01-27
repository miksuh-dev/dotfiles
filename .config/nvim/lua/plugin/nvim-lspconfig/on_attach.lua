return function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local function call_action(command)
    return '<cmd>lua require("plugin.nvim-lspconfig.functions").' .. command .. '()<CR>'
  end

  local opts = { noremap = true, silent = true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Goto
  buf_set_keymap('n', 'gD', call_action('declaration'), opts)
  buf_set_keymap('n', 'gd', call_action('definition'), opts)
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

  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  -- Format on save is available
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({ timeout_ms = 5000 })]])

    buf_set_keymap('n', '<leader>fo', call_action('format'), opts)
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<leader>fo', call_action('range_format'), opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end
