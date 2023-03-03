return {
  {
    'eggbean/vim-tmux-navigator-no-wrapping',
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
    'editorconfig/editorconfig-vim',
    config = function()
      require('config.editorconfig.load')
    end,
    cond = function()
      local stat = vim.loop.fs_stat(vim.fn.getcwd() .. '/.editorconfig')
      return (stat and stat.type) or false
    end,
  },
  {
    'Shatur/neovim-session-manager',
    event = 'VimEnter',
    config = function()
      require('config.neovim-session-manager.load')
    end,
  },
}
