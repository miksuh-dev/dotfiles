local theme = require('plugin.lualine.theme.dark')
local gps = require('nvim-gps')

local function get_gps()
  if gps.is_available() then
    return gps.get_location()
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
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
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
        update_in_insert = false,
      },
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
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
        update_in_insert = false,
      },
    },
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
})
