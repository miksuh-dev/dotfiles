local theme = require('config.lualine.themes.dark')

require'lualine'.setup{
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = {'|', '|'},
    section_separators = {'', ''},

    -- section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {
      -- 'encoding',
      'filetype'
    },
    lualine_y = {
      -- {
      --   'diff',
      --  color_added = "#a7e22e", -- changes diff's removed foreground color
      --  color_modified = "#e6db74", -- changes diff's modified foreground color
      --  color_removed = "#cc241d", -- changes diff's added foreground color
      -- },
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        color_error = "#e95678",
        color_warn = "#e6db74",
        color_info = "#f8f8f0",
        color_hint = "#66d9ef",
        symbols = {
          warning = 'W',
          error = "E",
          info = 'I',
          hint = 'H',
        }
      },
    },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
