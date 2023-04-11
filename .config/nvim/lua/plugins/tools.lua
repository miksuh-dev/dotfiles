return {
  {
    'github/copilot.vim',
    event = { 'InsertEnter', 'BufReadPre' },
    cmd = { 'Copilot' },
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'mechatroner/rainbow_csv',
    ft = 'csv',
    init = function()
      require('config.rainbow_csv.setup')
    end,
  },
}
