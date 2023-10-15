return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'hoob3rt/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
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
}
