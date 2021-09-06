
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-unimpaired' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'adelarsq/vim-matchit' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-fugitive' }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'tpope/vim-commentary' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'SirVer/ultisnips' }
  use { 'mlaursen/vim-react-snippets' }
  use { 'tomarrell/vim-npr' }
  use { 'jremmen/vim-ripgrep' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kabouzeid/nvim-lspinstall' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  use { 'tzachar/compe-tabnine', run = './install.sh'  }

  use {
    'glepnir/lspsaga.nvim',
    config = function() require('config.lspsaga') end
  }

  use {
    'mattn/emmet-vim',
    config = function() require('config.emmet') end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('config.nvim-lspconfig') end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function() require('config.nvim-compe') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('config.nvim-treesitter') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('config.telescope') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('config.nvim-tree') end
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function() require('config.lualine') end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns') end
  }

  use { 'norcalli/nvim-colorizer.lua',
    config = function() require('config.nvim-colorizer') end
  }

end)


