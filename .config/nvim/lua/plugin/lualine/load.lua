local theme = require('plugin.lualine.theme.dark')
local tabline = require('plugin.lualine.tabline')

local gps = require('nvim-gps')

-- TODO Use this to make console.log to output require('nvim-gps').get_data()
local function get_gps()
  if gps.is_available() then
    local location = gps.get_location()
    if location ~= '' then
      return '> ' .. location
    end
  end
  return ''
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = '',
    section_separators = '',
    disabled_filetypes = { 'NvimTree' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1) .. str:sub(2):lower()
        end,
      },
    },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        padding = {
          left = 1,
          right = 0,
        },
      },
      {
        get_gps,
      },
    },
    lualine_x = {
      -- 'encoding',
      'filetype',
    },
    lualine_y = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = {
          warn = 'W',
          error = 'E',
          info = 'I',
          hint = 'H',
        },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn = 'DiagnosticWarn',
          info = 'DiagnosticInfo',
          hint = 'DiagnosticHint',
        },
        update_in_insert = false,
      },
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1) .. str:sub(2):lower()
        end,
      },
    },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        padding = {
          left = 1,
          right = 0,
        },
      },
      {
        get_gps,
      },
    },
    lualine_x = {
      -- 'encoding',
      {
        'filetype',
        colored = false,
      },
    },
    lualine_y = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = {
          warn = 'W',
          error = 'E',
          info = 'I',
          hint = 'H',
        },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn = 'DiagnosticWarn',
          info = 'DiagnosticInfo',
          hint = 'DiagnosticHint',
        },
        update_in_insert = false,
      },
    },
    lualine_z = { 'location' },
  },
  tabline = {
    lualine_a = {},
    lualine_b = { tabline.harpoon_marks },
    -- lualine_c = { require('plugin.lualine.tabline_colors') },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
})
