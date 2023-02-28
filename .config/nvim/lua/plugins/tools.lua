return {
  {
    'vim-test/vim-test',
    cmd = {
      'TestSuite',
      'TestNearest',
      'TestFile',
      'TestLast',
      'TestVisit',
    },
    init = function()
      require('config.vim-test.setup')
    end,
  },
  {
    'preservim/vimux',
    dependencies = { 'vim-test' },
    cmd = {
      'VimuxRunCommand',
      'VimuxSendText',
      'VimuxSendKeys',
      'VimuxOpenRunner',
      'VimuxRunLastCommand',
      'VimuxCloseRunner',
      'VimuxInspectRunner',
      'VimuxInterruptRunner',
      'VimuxPromptCommand',
      'VimuxClearTerminalScreen',
      'VimuxClearRunnerHistory',
      'VimuxZoomRunner',
      'VimuxRunCommandInDir',
    },
    config = function()
      require('config.vimux.setup')
    end,
  },
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
}
