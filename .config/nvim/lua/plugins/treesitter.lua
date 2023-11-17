return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufWinEnter' },
    build = ':TSUpdateSync',
    config = function()
      require('config.nvim-treesitter.load')
    end,
    dependencies = {
      'andymass/vim-matchup',
    },
  },
  {
    'miksuh-dev/nvim-ts-autotag',
    ft = require('config.nvim-ts-autotag.filetypes'),
    config = function()
      require('config.nvim-ts-autotag.load')
    end,
  },
}
