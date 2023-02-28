return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      require('config.vim-dadbod-ui.load')
    end,
    keys = {
      '<leader>du',
    },
    cmd = {
      'DBUI',
      'DBUIAddConnection',
      'DBUIFindBuffer',
      'DBUILastQueryInfo',
      'DBUIRenameBuffer',
      'DBUIToggle',
    },
  },
}
