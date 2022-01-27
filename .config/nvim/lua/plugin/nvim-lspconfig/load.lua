require('nvim-lsp-installer').settings({
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
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
  },
  update_in_insert = false,
})

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
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

local lsp_installer_servers = require('nvim-lsp-installer')
local required_servers = require('plugin.nvim-lspconfig.required_servers')

for _, server in pairs(required_servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(server)
  local config = make_config()

  if server_available then
    requested_server:on_ready(function()
      local exists, lsp_create_config = pcall(require, 'plugin.nvim-lspconfig.language-server.' .. server)

      if exists then
        config = lsp_create_config(config)
        -- else -- TODO Setup rest of the active language server's config
        --   print('not found ' .. server)
      end

      requested_server:setup(config)
    end)
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end
