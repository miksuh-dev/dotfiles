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
    'ThePrimeagen/harpoon',
    config = function()
      require('config.harpoon.load')
    end,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require('config.oil.load')
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = {
      'Oil',
    },
  },
}
