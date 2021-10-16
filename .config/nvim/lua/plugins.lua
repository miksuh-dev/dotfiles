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

    use({
      'wbthomason/packer.nvim',
      event = 'VimEnter',
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
        require('config.comment')
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
      keys = {
        { 'i', '<C-Y>,' },
      },
      config = function()
        require('config.emmet-vim')
      end,
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
        require('config.nvim-autopairs')
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
        require('config.lualine')
      end,
    })

    use({
      'norcalli/nvim-colorizer.lua',
      event = 'BufReadPre',
      config = function()
        require('config.nvim-colorizer')
      end,
    })

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Navigation -------------------------------------------
    ------------------------------------------------------------------------------------------------

    use({
      'kyazdani42/nvim-tree.lua',
      cmd = {
        'NvimTreeClipboard',
        'NvimTreeClose',
        'NvimTreeFindFile',
        'NvimTreeFocus',
        'NvimTreeOpen',
        'NvimTreeRefresh',
        'NvimTreeResize',
        'NvimTreeToggle',
      },
      keys = {
        { 'n', '<leader>n' },
        { 'n', '<leader>N' },
      },
      config = function()
        require('config.nvim-tree')
      end,
    })

    use({
      'nvim-telescope/telescope.nvim',
      cmd = { 'Telescope' },
      module = 'telescope',
      keys = {
        { 'n', '<leader>ff' },
        { 'n', '<leader>fd' },
        { 'n', '<c-p>' },
        { 'n', '<leader>fs' },
        { 'n', '<leader>fg' },
        { 'n', '<leader>fb' },
        { 'n', '<leader>fh' },
        { 'n', '<leader>fw' },
        { 'n', '<leader>fW' },
      },
      config = function()
        require('config.telescope')
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
        require('config.nvim-lspconfig')
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
        require('config.nvim-cmp')
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
        require('config.cmp-tabnine')
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
        require('config.nvim-treesitter')
      end,
    })

    use({
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
      requires = 'nvim-treesitter',
    })

    use({
      'windwp/nvim-ts-autotag',
      ft = require('config.nvim-ts-autotag.filetypes'),
      requires = 'nvim-treesitter',
      config = function()
        require('config.nvim-ts-autotag')
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
        require('config.gitsigns')
      end,
    })

    use({
      'tpope/vim-fugitive',
      cond = function()
        return vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') ~= 0
      end,
      cmd = { 'G', 'Git' },
      config = function()
        require('config.vim-fugitive')
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
