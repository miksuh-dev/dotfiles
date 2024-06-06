return {
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      require('config.vim-tmux-navigator.load')
    end,
    keys = {
      { '<C-H>' },
      { '<C-J>' },
      { '<C-K>' },
      { '<C-L>' },
    },
  },
  {
    'tpope/vim-repeat',
    event = 'BufReadPre',
  },
  {
    'tpope/vim-surround',
    keys = {
      { 'yss' },
      { 'S', mode = 'x' },
      { 'ys' },
      { 'cs' },
      { 'ds' },
    },
  },
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
    },
    config = function()
      require('config.comment.load')
    end,
    commit = 'fe9bbdbcd2f1b85cc8fccead68122873d94f8397',
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('config.ts-context-commentstring.load')
    end,
  },
  {
    'tpope/vim-unimpaired',
    keys = {
      { '[' },
      { ']' },
      { '<' },
      { '>' },
      { '=' },
    },
  },

  {
    'nvim-lua/plenary.nvim',
  },

  {
    'windwp/nvim-autopairs',
    keys = {
      { '"', mode = 'i' },
      { "'", mode = 'i' },
      { '`', mode = 'i' },
      { '[', mode = 'i' },
      { '{', mode = 'i' },
    },
    config = function()
      require('config.nvim-autopairs.load')
    end,
  },
  {
    'Shatur/neovim-session-manager',
    event = 'VimEnter',
    config = function()
      require('config.neovim-session-manager.load')
    end,
  },
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    config = function()
      require('config.conform.load')
    end,
  },
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
  },
}
