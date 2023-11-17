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
    'NvChad/nvim-colorizer.lua',
    init = function()
      require('config.nvim-colorizer.load')
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
}
