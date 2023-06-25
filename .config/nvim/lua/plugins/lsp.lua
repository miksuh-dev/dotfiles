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
    'linrongbin16/lsp-progress.nvim',
    event = { 'VimEnter' },
    config = function()
      require('config.lsp-progress.load')
    end,
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
