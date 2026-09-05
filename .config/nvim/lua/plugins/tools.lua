return {
  {
    'github/copilot.vim',
    event = { 'InsertEnter', 'BufReadPre' },
    cmd = { 'Copilot' },
  },
  {
    'mechatroner/rainbow_csv',
    ft = 'csv',
    init = function()
      require('config.rainbow_csv.setup')
    end,
  },
}
