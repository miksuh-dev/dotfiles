local util = require('common.util')

local ls = require('luasnip')
-- local types = require('luasnip.util.types')

local function get_snippet_paths()
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

ls.config.set_config({
  history = false,
  updateevents = 'TextChanged,TextChangedI',
  -- updateevents = 'InsertLeave',
  -- ext_opts = {
  --   [types.choiceNode] = {
  --     active = {
  --       virt_text = { { '<-', 'Error' } },
  --     },
  --   },
  -- },
})

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {
  silent = true,
})

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if util.is_plugin_loaded('neogen') then
    local neogen = require('neogen')

    if neogen.jumpable() then
      neogen.jump_prev()
      return
    end
  end

  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {
  silent = true,
})

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if util.is_plugin_loaded('neogen') then
    local neogen = require('neogen')

    if neogen.jumpable() then
      neogen.jump_next()
      return
    end
  end

  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {
  silent = true,
})

-- use javascriptreact on javascript files
ls.filetype_set('javascript', { 'javascriptreact' })

require('luasnip/loaders/from_vscode').lazy_load({
  paths = get_snippet_paths(),
})
