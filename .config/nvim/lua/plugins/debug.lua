return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('config.dap.load')
    end,
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require('config.dap.ui.load')
        end,
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('config.dap.virtual-text.load')
        end,
      },
    },
  },
}