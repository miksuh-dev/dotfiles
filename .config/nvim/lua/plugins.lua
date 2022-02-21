local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup({
  function(use)
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Common -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'wbthomason/packer.nvim',
    })

    use({
      'nathom/filetype.nvim',
      branch = 'dev',
      config = function()
        require('plugin.filetype.load')
      end,
    })

    use({
      'eggbean/vim-tmux-navigator-no-wrapping',
      config = function()
        require('plugin/vim-tmux-navigator.load')
      end,
      keys = {
        { 'n', '<C-H>' },
        { 'n', '<C-J>' },
        { 'n', '<C-K>' },
        { 'n', '<C-L>' },
        { 'n', '<C-Space>' },
      },
    })

    use({
      'tpope/vim-repeat',
      event = 'BufReadPre',
    })

    use({
      'tpope/vim-surround',
      keys = {
        { 'n', 'yss' },
        { 'x', 'S' },
        { 'n', 'ys' },
        { 'n', 'cs' },
        { 'n', 'ds' },
      },
    })

    use({
      'numToStr/Comment.nvim',
      keys = {
        'gc',
        'gb',
      },
      config = function()
        require('plugin.comment.load')
      end,
    })

    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
      module = 'ts_context_commentstring',
    })

    use({
      'tpope/vim-unimpaired',
      keys = {
        { 'n', '[' },
        { 'n', ']' },
        { 'n', '{' },
        { 'n', '}' },
        { 'n', '<' },
        { 'n', '>' },
        { 'n', '=' },
      },
    })

    use({
      'nvim-lua/popup.nvim',
      module = 'popup',
    })

    use({
      'nvim-lua/plenary.nvim',
      module = 'plenary',
    })

    use({
      'mattn/emmet-vim',
      config = function()
        require('plugin.emmet-vim.load')
      end,
      keys = {
        { 'i', '<C-Y>,' },
      },
    })

    use({
      'windwp/nvim-autopairs',
      keys = {
        { 'i', '"' },
        { 'i', "'" },
        { 'i', '`' },
        { 'i', '(' },
        { 'i', '[' },
        { 'i', '{' },
      },
      module = 'nvim-autopairs',
      config = function()
        require('plugin.nvim-autopairs.load')
      end,
    })

    use({
      'editorconfig/editorconfig-vim',
      config = function()
        require('plugin.editorconfig.load')
      end,
      cond = function()
        local stat = vim.loop.fs_stat(vim.fn.getcwd() .. '/.editorconfig')
        return (stat and stat.type) or false
      end,
    })

    use({
      'tversteeg/registers.nvim',
      keys = {
        { 'i', '<C-R>' },
        { 'v', '"' },
        { 'n', '"' },
      },
      config = function()
        require('plugin.registers.load')
      end,
    })

    use({
      'David-Kunz/jester',
      module = { 'jester' },
    })

    use({
      'rmagatti/auto-session',
      event = 'VimEnter',
      config = function()
        require('plugin.auto-session.load')
      end,
    })

    use({
      'ThePrimeagen/refactoring.nvim',
      config = function()
        require('plugin.refactoring.load')
      end,
      keys = {
        { 'v', '<leader>rr' },
        { 'n', '<leader>rp' },
        { 'v', '<leader>rv' },
        { 'n', '<leader>rc' },
      },
    })
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- UI ---------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'kyazdani42/nvim-web-devicons',
      module = 'nvim-web-devicons',
    })

    use({
      'hoob3rt/lualine.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      event = 'VimEnter',
      config = function()
        require('plugin.lualine.load')
      end,
    })

    use({
      'SmiteshP/nvim-gps',
      module = { 'nvim-gps' },
      config = function()
        require('plugin.nvim-gps.load')
      end,
    })

    use({
      'RRethy/vim-hexokinase',
      run = 'make hexokinase',
      event = 'BufReadPre',
      setup = function()
        require('plugin.hexokinase.load')
      end,
    })

    use({
      'kevinhwang91/nvim-bqf',
      ft = 'qf',
      config = function()
        require('plugin.nvim-bqf.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- DEBUG ------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'puremourning/vimspector',
      config = function()
        require('plugin.vimspector.load')
      end,
      keys = {
        { 'n', '<leader>dd' },
      },
      cmd = {
        'VimspectorAbortInstall',
        'VimspectorDebugInfo',
        'VimspectorEval',
        'VimspectorInstall',
        'VimspectorLoadSession',
        'VimspectorMkSession',
        'VimspectorReset',
        'VimspectorShowOutput',
        'VimspectorToggleLog',
        'VimspectorUpdate',
        'VimspectorWatchk',
      },
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Navigation -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'nvim-telescope/telescope.nvim',
      cmd = { 'Telescope' },
      module = 'telescope',
      config = function()
        require('plugin.telescope.load')
      end,
    })

    use({
      'MunifTanjim/nui.nvim',
      module = 'nui',
    })

    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'main',
      cmd = {
        'NeoTreeClose',
        'NeoTreeFloat',
        'NeoTreeFloatToggle',
        'NeoTreeFocus',
        'NeoTreeFocusToggle',
        'NeoTreeLogs',
        'NeoTreePasteConfig',
        'NeoTreeReveal',
        'NeoTreeRevealInSplit',
        'NeoTreeRevealInSplitToggle',
        'NeoTreeRevealToggle',
        'NeoTreeSetLogLevel',
        'NeoTreeShow',
        'NeoTreeShowInSplitD',
        'NeoTreeShowInSplitToggle',
        'NeoTreeShowToggle',
      },
      config = function()
        require('plugin.neo-tree.load')
      end,
    })

    use({
      'ThePrimeagen/harpoon',
      module = { 'harpoon', 'harpoon.ui', 'harpoon.mark' },
      config = function()
        require('plugin.harpoon.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Lsp --------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'neovim/nvim-lspconfig',
      event = 'BufReadPre',
      cmd = { 'LspInfo', 'LspRestart', 'LspStart', 'LspStop' },
      config = function()
        require('plugin.nvim-lspconfig.load')
      end,
    })

    use({
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      module = 'nvim-lsp-ts-utils',
      requires = 'nvim-lspconfig',
    })

    use({
      'williamboman/nvim-lsp-installer',
      module = 'nvim-lsp-installer',
      requires = 'nvim-lspconfig',
      cmd = {
        'LspInstallInfo',
        'LspInstall',
        'LspUninstall',
        'LspUninstallAll',
        'LspInstallLog',
        'LspPrintInstalled',
      },
    })

    use({
      'b0o/schemastore.nvim',
      module = 'schemastore',
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Snippets ---------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'rafamadriz/friendly-snippets',
      event = 'InsertEnter',
    })

    use({
      'L3MON4D3/LuaSnip',
      after = 'friendly-snippets',
      config = function()
        require('plugin.luasnips.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Cmp --------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'hrsh7th/nvim-cmp',
      after = 'LuaSnip',
      config = function()
        require('plugin.nvim-cmp.load')
      end,
    })

    use({
      'hrsh7th/cmp-nvim-lsp',
      module = 'cmp_nvim_lsp',
      after = 'nvim-cmp',
      requires = {
        'nvim-cmp',
        'nvim-lspconfig',
      },
    })

    use({
      'saadparwaiz1/cmp_luasnip',
      after = 'nvim-cmp',
    })

    use({
      'hrsh7th/cmp-buffer',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    use({
      'hrsh7th/cmp-calc',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    use({
      'hrsh7th/cmp-path',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    use({
      'andersevenrud/cmp-tmux',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    use({
      'kristijanhusak/vim-dadbod-completion',
      after = 'nvim-cmp',
      requires = { 'nvim-cmp', 'vim-dadbod-ui' },
    })

    use({
      'davidsierradz/cmp-conventionalcommits',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    --    use({
    --      'tzachar/cmp-tabnine',
    --      run = './install.sh',
    --      after = 'nvim-cmp',
    --      requires = 'hrsh7th/nvim-cmp',
    --      config = function()
    --        require('plugin.tabnine.load')
    --      end,
    --    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Treesitter -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdateSync',
      module = 'nvim-treesitter',
      config = function()
        require('plugin.nvim-treesitter.load')
      end,
    })

    use({
      'nvim-treesitter/playground',
      cmd = {
        'TSPlaygroundToggle',
        'TSHighlightCapturesUnderCursor',
      },
      requires = 'nvim-treesitter',
    })

    use({
      'windwp/nvim-ts-autotag',
      ft = require('plugin.nvim-ts-autotag.filetypes'),
      requires = 'nvim-treesitter',
      config = function()
        require('plugin.nvim-ts-autotag.load')
      end,
    })

    use({
      'lukas-reineke/indent-blankline.nvim',
      requires = 'nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugin.indent-blankline.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- DB ---------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'tpope/vim-dadbod',
      cmd = 'DB',
      after = 'vim-dadbod-ui',
    })

    use({
      'kristijanhusak/vim-dadbod-ui',
      requires = 'vim-dadbod',
      config = function()
        require('plugin.vim-dadbod-ui.load')
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
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Git --------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'lewis6991/gitsigns.nvim',
      cond = function()
        return vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0
      end,
      config = function()
        require('plugin.gitsigns.load')
      end,
    })

    use({
      'tpope/vim-fugitive',
      -- cond = function()
      --   return vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0
      -- end,
      keys = {
        '<leader>gf',
        '<leader>gj',
        '<leader>gs',
        '<leader>gb',
        '<leader>gd',
      },
      cmd = { 'G', 'Git' },
      config = function()
        require('plugin.vim-fugitive.load')
      end,
    })
  end,
  config = {
    git = {
      clone_timeout = 600,
    },
    max_jobs = 5,
  },
})

----------------------------------------------------------------------------------------------------
----------------------------------------- Disabled -------------------------------------------------
----------------------------------------------------------------------------------------------------

-- use({
--   'romgrk/barbar.nvim',
--   module = 'bufferline',
--   event = 'BufEnter',
--   config = function()
--     require('plugin.barbar.load')
--   end,
-- })
