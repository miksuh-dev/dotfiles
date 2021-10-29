local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup({
  function(use)
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Common -----------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- TODO: Check these plugins:
    -- https://github.com/romainl/vim-qf (improves quickfix list)

    use({
      'wbthomason/packer.nvim',
    })

    use({
      'tjdevries/astronauta.nvim',
    })

    use ({
      'eggbean/vim-tmux-navigator-no-wrapping',
      config = function ()
        require('plugin/vim-tmux-navigator.load')
      end
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
      after = 'nvim-cmp',
      keys = {
        { 'i', '"' },
        { 'i', "'" },
        { 'i', '`' },
        { 'i', '(' },
        { 'i', '[' },
        { 'i', '{' },
      },
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
      'norcalli/nvim-colorizer.lua',
      event = 'BufReadPre',
      config = function()
        require('plugin.nvim-colorizer.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Navigation -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'kyazdani42/nvim-tree.lua',
      module = { 'nvim-tree' },
      config = function()
        require('plugin.nvim-tree.load')
      end,
    })

    use({
      'nvim-telescope/telescope.nvim',
      cmd = { 'Telescope' },
      module = 'telescope',
      config = function()
        require('plugin.telescope.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Lsp --------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'neovim/nvim-lspconfig',
      event = 'BufReadPre',
      cmd = { 'LspInfo', 'LspInstall', 'LspRestart', 'LspStart', 'LspStop', 'LspUninstall' },
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
      'kabouzeid/nvim-lspinstall',
      cmd = { 'LspInstall', 'LspUninstall' },
      module = 'lspinstall',
      requires = 'nvim-lspconfig',
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Cmp --------------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        require('plugin.nvim-cmp.load')
      end,
    })

    use({
      'hrsh7th/cmp-nvim-lsp',
      module = 'cmp_nvim_lsp',
      requires = {
        'nvim-cmp',
        'nvim-lspconfig',
      },
    })

    use({
      'SirVer/ultisnips',
      after = 'nvim-cmp',
      method = 'UltiSnips',
      requires = 'nvim-cmp',
    })

    use({
      'quangnguyen30192/cmp-nvim-ultisnips',
      after = 'ultisnips',
      requires = { 'nvim-cmp', 'ultisnips' },
    })

    use({
      'mlaursen/vim-react-snippets',
      ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      requires = { 'nvim-cmp', 'ultisnips' },
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
      'tzachar/cmp-tabnine',
      run = './install.sh',
      after = 'nvim-cmp',
      requires = 'nvim-cmp',
      config = function()
        require('plugin.cmp-tabnine.load')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Treesitter -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufRead',
      module = 'nvim-treesitter',
      config = function()
        require('plugin.nvim-treesitter.load')
      end,
    })

    use({
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
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

    ----------------------------------------------------------------------------
    ------------------------------- Git ----------------------------------------
    ----------------------------------------------------------------------------

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
