return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('config.nvim-cmp.load')
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-calc',
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'davidsierradz/cmp-conventionalcommits',
      'jcha0713/cmp-tw2css',
    },
  },
}
