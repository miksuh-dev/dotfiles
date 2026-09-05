return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufWinEnter' },
    branch = 'main',
    build = ':TSUpdateSync',
    config = function()
      require('config.nvim-treesitter.load')
    end,
    dependencies = {
      'andymass/vim-matchup',
    },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = require('config.nvim-ts-autotag.filetypes'),
    config = function()
      require('config.nvim-ts-autotag.load')
    end,
  },
}
