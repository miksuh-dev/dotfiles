return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufWinEnter' },
    build = ':TSUpdateSync',
    config = function()
      require('config.nvim-treesitter.load')
    end,
  },
  {
    'nvim-treesitter/playground',
    cmd = {
      'TSPlaygroundToggle',
      'TSHighlightCapturesUnderCursor',
    },
    dependencies = 'nvim-treesitter',
  },
  {
    'miksuh-dev/nvim-ts-autotag',
    dependencies = 'nvim-treesitter',
    config = function()
      require('config.nvim-ts-autotag.load')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = 'nvim-treesitter',
    config = function()
      require('config.indent-blankline.load')
    end,
    commit = '0722eabb2d11e239fe9c4dce313d5ae637130764',
  },
  {
    'andymass/vim-matchup',
  },
}
