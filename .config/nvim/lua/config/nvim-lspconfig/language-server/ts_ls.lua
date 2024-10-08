local on_attach = require('config.nvim-lspconfig.on_attach')

local root_dir_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  '.git',
}

return function(config)
  config.root_dir = function(fname)
    return require('lspconfig').util.root_pattern(root_dir_files)(fname) or vim.fn.getcwd()
  end

  config.settings = {
    completions = {
      completeFunctionCalls = true,
    },
  }

  config.init_options = {
    preferences = {
      -- includeInlayParameterNameHints = 'literals',
      -- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      -- includeInlayFunctionParameterTypeHints = false,
      -- includeInlayVariableTypeHints = false,
      -- includeInlayPropertyDeclarationTypeHints = true,
      -- includeInlayFunctionLikeReturnTypeHints = false,
      -- includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = 'non-relative',
    },
  }

  config.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.inlayHintProvider = false

    on_attach(client, bufnr)
  end

  return config
end
