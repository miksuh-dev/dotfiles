return {
  {
    'lewis6991/gitsigns.nvim',
    branch = 'main',
    event = { 'BufReadPre' },
    config = function()
      require('config.gitsigns.load')
    end,
  },
  {
    'tpope/vim-fugitive',
    keys = {
      '<leader>gf',
      '<leader>gj',
      '<leader>gs',
      '<leader>gb',
      '<leader>gd',
    },
    cmd = { 'G', 'Git' },
    config = function()
      require('config.vim-fugitive.load')
    end,
  },
}
