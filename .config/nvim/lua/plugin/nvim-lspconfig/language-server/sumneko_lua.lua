return function(config)
  config.settings = {
    Lua = {
      hint = {
        enable = true,
        showGlobalFunctions = true,
        showGlobalMethods = true,
        showGlobalVariables = true,
        showMetaMethods = true,
        showStaticMethods = true,
        showStaticVariables = true,
        showVariables = true,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  }

  return config
end
