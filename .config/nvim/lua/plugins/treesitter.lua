return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufWinEnter' },
    build = ':TSUpdateSync',
    config = function()
      require('config.nvim-treesitter.load')
    end,
    dependencies = {
      {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
          require('config.indent-blankline.load')
        end,
        commit = '0722eabb2d11e239fe9c4dce313d5ae637130764',
      },
      'nvim-treesitter/nvim-treesitter-textobjects',
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
