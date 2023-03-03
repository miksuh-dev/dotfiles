return {
  {
    'kyazdani42/nvim-web-devicons',
  },
  {
    'hoob3rt/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = 'VimEnter',
    config = function()
      require('config.lualine.load')
    end,
  },
  {
    'RRethy/vim-hexokinase',
    build = 'make hexokinase',
    event = 'BufReadPre',
    init = function()
      require('config.hexokinase.load')
    end,
  },
  {
    'mrshmllow/document-color.nvim',
    config = function()
      require('config.document-color.load')
    end,
  },
  {
    'tversteeg/registers.nvim',
    config = function()
      require('config.registers.load')
    end,
    keys = {
      { '<c-r>', mode = 'i' },
    },
  },
  {
    'MunifTanjim/nui.nvim',
  },
  {
    'lvimuser/lsp-inlayhints.nvim',
    config = function()
      require('config.lsp-inlayhints.load')
    end,
  },
}
