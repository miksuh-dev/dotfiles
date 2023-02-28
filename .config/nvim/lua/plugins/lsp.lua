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
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    build = ':MasonToolsInstall',
    cmd = {
      'MasonToolsInstall',
      'MasonToolsUpdate',
    },
  },
  {
    'b0o/schemastore.nvim',
  },
  {
    'Hoffs/omnisharp-extended-lsp.nvim',
  },
}
