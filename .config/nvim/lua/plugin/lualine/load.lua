local theme = require('plugin.lualine.theme.dark')
local tabline = require('plugin.lualine.tabline')

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = '',
    section_separators = '',
    disabled_filetypes = { 'NvimTree' },
    globalstatus = true,
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
    },
    lualine_x = {
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
  inactive_sections = {},
  tabline = {
    lualine_a = {},
    lualine_b = {
      {
        tabline,
        padding = {
          left = 0,
          right = 0,
        },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
})
