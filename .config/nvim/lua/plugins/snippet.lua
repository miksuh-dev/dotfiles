return {
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    config = function()
      require('config.luasnips.load')
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
}

