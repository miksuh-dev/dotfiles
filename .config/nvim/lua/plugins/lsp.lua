return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    cmd = { 'LspInfo', 'LspRestart', 'LspStart', 'LspStop' },
    config = function()
      require('config.nvim-lspconfig.load')
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('config.fidget.load')
    end,
    event = 'BufReadPre',
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    build = ':MasonToolsInstall',
    cmd = {
      'MasonToolsInstall',
      'MasonToolsUpdate',
    },
  },
  'Hoffs/omnisharp-extended-lsp.nvim',
  'b0o/schemastore.nvim',
}
