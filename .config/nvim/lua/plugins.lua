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

    -- use({
    --   'nathom/filetype.nvim',
    --   config = function()
    --     require('plugin.filetype.load')
    --   end,
    -- })

    use({
      'eggbean/vim-tmux-navigator-no-wrapping',
      config = function()
        require('plugin.vim-tmux-navigator.load')
      end,
      keys = {
        { 'n', '<C-H>' },
        { 'n', '<C-J>' },
        { 'n', '<C-K>' },
        { 'n', '<C-L>' },
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
        { 'n', '<' },
        { 'n', '>' },
        { 'n', '=' },
      },
    })

    use({
      'nvim-lua/plenary.nvim',
      module = 'plenary',
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
      'Shatur/neovim-session-manager',
      event = 'VimEnter',
      config = function()
        require('plugin.neovim-session-manager.load')
      end,
    })

    -- use({
    --   'rmagatti/auto-session',
    --   event = 'VimEnter',
    --   config = function()
    --     require('plugin.auto-session.load')
    --   end,
    -- })

    use({
      'danymat/neogen',
      config = function()
        require('plugin.neogen.load')
      end,
      module = { 'neogen' },
      requires = 'nvim-treesitter/nvim-treesitter',
    })

    use({
      'AndrewRadev/splitjoin.vim',
      keys = {
        { 'n', 'gS' },
        { 'n', 'gJ' },
      },
    })

    use({
      'ThePrimeagen/refactoring.nvim',
      keys = {
        { 'v', '<leader>rr' },
      },
      config = function()
        require('plugin.refactoring.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- UI ---------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'kyazdani42/nvim-web-devicons',
      module = 'nvim-web-devicons',
    })

    use({
      'MunifTanjim/nui.nvim',
      module = 'nui',
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
      after = 'nvim-treesitter',
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

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Debugging ------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'mfussenegger/nvim-dap',
      module = { 'dap' },
    })

    use({
      'Pocco81/DAPInstall.nvim',
      after = { 'nvim-dap' },
      cmd = {
        'DIInstall',
        'DIUninstall',
        'DIList',
      },
      config = function()
        require('plugin.dap.install.load')
      end,
    })

    use({
      'rcarriga/nvim-dap-ui',
      after = { 'nvim-dap' },
      requires = { 'nvim-dap' },
      module = {
        'dapui',
      },
      config = function()
        require('plugin.dap.ui.load')
      end,
    })

    use({
      'theHamsta/nvim-dap-virtual-text',
      requires = { 'nvim-dap' },
      after = 'nvim-dap',
      config = function()
        require('plugin.dap.virtual-text.load')
      end,
    })

    use({
      'nvim-telescope/telescope-dap.nvim',
      after = 'nvim-dap',
      config = function()
        require('plugin.dap.telescope-plugin.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Tools ------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
      setup = function()
        require('plugin.markdown-preview.setup')
      end,
    })

    use({
      'vim-test/vim-test',
      cmd = {
        'TestSuite',
        'TestNearest',
        'TestFile',
        'TestLast',
        'TestVisit',
      },
      setup = function()
        require('plugin.vim-test.setup')
      end,
    })

    use({
      'github/copilot.vim',
      event = { 'InsertEnter', 'BufReadPre' },
      cmd = { 'Copilot' },
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Navigation -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'nvim-telescope/telescope-fzf-native.nvim',
      cmd = { 'Telescope' },
      module = 'telescope',
      run = 'make',
    })

    use({
      'nvim-telescope/telescope.nvim',
      after = 'telescope-fzf-native.nvim',
      config = function()
        require('plugin.telescope.load')
      end,
    })

    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'main',
      module = 'neo-tree',
      cmd = {
        'Neotree',
      },
      config = function()
        require('plugin.neo-tree.load')
      end,
    })

    use({
      'ThePrimeagen/harpoon',
      module = { 'harpoon', 'harpoon.ui', 'harpoon.mark' },
      after = 'lualine.nvim',
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
      event = { 'InsertEnter', 'BufReadPre' },
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
      'hrsh7th/cmp-nvim-lua',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
    })

    use({
      'kristijanhusak/vim-dadbod-completion',
      after = { 'vim-dadbod-ui', 'nvim-cmp' },
      requires = { 'nvim-cmp', 'vim-dadbod-ui' },
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Treesitter -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdateSync',
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
      requires = 'nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugin.nvim-ts-autotag.load')
      end,
    })

    use({
      'nvim-treesitter/nvim-treesitter-textobjects',
      requires = 'nvim-treesitter',
      after = 'nvim-treesitter',
    })

    use({
      'lukas-reineke/indent-blankline.nvim',
      requires = 'nvim-treesitter',
      after = 'nvim-treesitter',
      config = function()
        require('plugin.indent-blankline.load')
      end,
    })

    use({
      'andymass/vim-matchup',
      after = 'nvim-treesitter',
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
    display = {
      prompt_border = require('common.border'),
    },
  },
})
