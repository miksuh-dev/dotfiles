return {
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('config.telescope.load')
    end,
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'main',
    cmd = { 'Neotree' },
    config = function()
      require('config.neo-tree.load')
    end,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('config.harpoon.load')
    end,
  },
}
