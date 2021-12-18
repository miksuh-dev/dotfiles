local ls = require('luasnip')

local function get_snippet_paths()
  local util = require('common.util')

  local packer_config = require('packer').config
  local package_root = packer_config.package_root
  local plugin_package = packer_config.plugin_package

  local friendly_snippets_path = package_root .. '/' .. plugin_package .. '/opt/friendly-snippets/'
  local customer_snippets_path = vim.fn.stdpath('config') .. '/lua/snippet/'

  local paths = {}
  if util.is_directory(friendly_snippets_path) then
    table.insert(paths, friendly_snippets_path)
  else
    print('Failed to find friendly_snippets_path')
  end

  if util.is_directory(customer_snippets_path) then
    table.insert(paths, customer_snippets_path)
  else
    print('Failed to find customer_snippets_path')
  end

  return paths
end

-- use javascriptreact on javascript files
ls.filetype_set('javascript', { 'javascriptreact' })

require('luasnip/loaders/from_vscode').lazy_load({
  paths = get_snippet_paths(),
})
