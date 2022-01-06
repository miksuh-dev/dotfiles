return function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  local opts = { noremap = true, silent = true }

  -- Goto
  buf_set_keymap('n', 'gD', '<cmd>lua require("plugin.nvim-lspconfig.functions").declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua require("plugin.nvim-lspconfig.functions").definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua require("plugin.nvim-lspconfig.functions").hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua require("plugin.nvim-lspconfig.functions").implementations()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua require("plugin.nvim-lspconfig.functions").type_definitions()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("plugin.nvim-lspconfig.functions").references()<CR>', opts)

  -- Signature help
  buf_set_keymap('n', '<c-s>', '<cmd>lua require("plugin.nvim-lspconfig.functions").signature_help()<CR>', opts)
  buf_set_keymap('i', '<c-s>', '<cmd>lua require("plugin.nvim-lspconfig.functions").signature_help()<CR>', opts)

  -- Rename
  buf_set_keymap('n', '<leader>rn', '<cmd>lua require("plugin.nvim-lspconfig.functions").rename()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>?', '<cmd>lua require("plugin.nvim-lspconfig.functions").diagnostics_line()<CR>', opts)

  buf_set_keymap('n', '<leader>k', '<cmd>lua require("plugin.nvim-lspconfig.functions").goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>j', '<cmd>lua require("plugin.nvim-lspconfig.functions").goto_next()<CR>', opts)

  buf_set_keymap('n', '<leader>J', '<cmd>lua require("plugin.nvim-lspconfig.functions").set_loc_list()<CR>', opts)

  -- Code actions
  buf_set_keymap('n', '<leader>a', '<cmd>lua require("plugin.nvim-lspconfig.functions").code_actions()<CR>', opts)
  buf_set_keymap('v', '<leader>a', '<cmd>lua require("plugin.nvim-lspconfig.functions").range_code_actions()<CR>', opts)

  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  -- Format on save is available
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({ timeout_ms = 5000 })]])
    buf_set_keymap('n', '<leader>fo', '<cmd>lua require("plugin.nvim-lspconfig.functions").formatting()<CR>', opts)
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(
      'v',
      '<leader>fo',
      '<cmd>lua require("plugin.nvim-lspconfig.functions").range_formatting()<CR>',
      opts
    )
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
