local function get_active_panels()
  local initial_offset = require('plugin.barbar.config').initial_offset
  local offset = require('bufferline.state').offset

  if offset <= initial_offset then
    return {
      nvimtree = false,
      dbui = false,
    }
  end

  local nvimtree = require('plugin.nvim-tree.config')
  if offset == initial_offset + nvimtree.width + 1 then
    return {
      nvimtree = true,
      dbui = false,
    }
  end

  local dbui = require('plugin.vim-dadbod-ui.config')
  if offset == initial_offset + dbui.width + 1 then
    return {
      nvimtree = false,
      dbui = true,
    }
  end

  return {
    nvimtree = true,
    dbui = true,
  }
end

local function update_barbar(offset, title)
  local initial_offset = require('plugin.barbar.config').initial_offset

  if offset <= initial_offset then
    return require('bufferline.state').set_offset(initial_offset)
  end

  if title == nil then
    title = ''
  end

  return require('bufferline.state').set_offset(offset + initial_offset, title)
end

local M = {}

M.collapse = function(panel)
  local barbar_config = require('plugin.barbar.config')
  local nvimtree = require('plugin.nvim-tree.config')
  local dbui = require('plugin.vim-dadbod-ui.config')

  -- fallback if no panel
  if panel == nil then
    return require('bufferline.state').set_offset(barbar_config.initial_offset)
  end

  local active_panels = get_active_panels()
  local offset = require('bufferline.state').offset

  if panel == 'nvimtree' then
    if active_panels.dbui then
      -- TODO fix these magic numbers, and use initial_offset on calculations instead
      return update_barbar(offset - nvimtree.width - 6, dbui.title)
    end
  end

  if panel == 'dbui' then
    if active_panels.nvimtree then
      return update_barbar(offset - dbui.width - 6, nvimtree.title)
    end
  end
  return update_barbar(0)
end

M.expand = function(panel)
  local active_panels = get_active_panels()
  local offset = require('bufferline.state').offset

  if panel == 'nvimtree' then
    local nvimtree = require('plugin.nvim-tree.config')

    if active_panels.dbui then
      return update_barbar(offset + nvimtree.width - 4, 'NvimTree / DBUI')
    end

    return update_barbar(nvimtree.width + 1, nvimtree.title)
  end

  if panel == 'dbui' then
    local dbui = require('plugin.vim-dadbod-ui.config')

    if active_panels.nvimtree then
      return update_barbar(offset + dbui.width - 4, 'NvimTree / DBUI')
    end

    return update_barbar(dbui.width + 1, dbui.title)
  end
end

M.move_to_buffer = function(tab_number)
  if vim.bo.filetype == 'NvimTree' or vim.bo.filetype == 'DBUI' then
    M.collapse()
  end

  if tab_number == 0 then
    return vim.cmd(':BufferLast')
  end

  return vim.cmd(':BufferGoto ' .. tab_number)
end

return M
