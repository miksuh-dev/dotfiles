require('mason').setup({
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = require('plugin.nvim-lspconfig.required_servers'),
})

require('mason-tool-installer').setup({
  ensure_installed = require('plugin.nvim-lspconfig.required_tools'),
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or require('common.border')
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    source = 'always',
    spacing = 2,
  },
  update_in_insert = false,
})

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local root_dir = function(fname)
    return require('lspconfig').util.root_pattern('.git')(fname) or vim.fn.getcwd()
  end

  return {
    capabilities = capabilities,
    on_attach = require('plugin.nvim-lspconfig.on_attach'),
    root_dir = root_dir,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

local lsp_installed_servers = require('mason-lspconfig').get_installed_servers()
for _, server_name in pairs(lsp_installed_servers) do
  local initial_config = make_config()

  local exists, lsp_create_config = pcall(require, 'plugin.nvim-lspconfig.language-server.' .. server_name)

  local config = exists and lsp_create_config(initial_config) or initial_config

  require('lspconfig')[server_name].setup(config)
end
