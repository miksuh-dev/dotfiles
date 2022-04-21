local theme = require('plugin.lualine.theme.dark')
local tabline = require('plugin.lualine.tabline')
local util = require('common.util')

local function get_gps()
  if util.is_plugin_loaded('nvim-treesitter') then
    local gps = require('nvim-gps')

    if gps.is_available() then
      return gps.get_location()
    end
  end
end

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
      {
        get_gps,
        fmt = function(str)
          return str ~= '' and '> ' .. str or ''
        end,
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
    -- lualine_a = {
    --   {
    --     'mode',
    --     fmt = function(str)
    --       return str:sub(1, 1) .. str:sub(2):lower()
    --     end,
    --   },
    -- },
    -- lualine_b = { 'branch' },
    -- lualine_c = {
    --   {
    --     'filename',
    --     file_status = true,
    --     path = 1,
    --     padding = {
    --       left = 1,
    --       right = 0,
    --     },
    --   },
    --   {
    --     gps.get_location,
    --     cond = gps.is_available,
    --     fmt = function(str)
    --       return str ~= '' and '> ' .. str or ''
    --     end,
    --   },
    -- },
    -- lualine_x = {
    --   -- 'encoding',
    --   {
    --     'filetype',
    --     colored = false,
    --   },
    -- },
    -- lualine_y = {
    --   {
    --     'diagnostics',
    --     sources = { 'nvim_diagnostic' },
    --     sections = { 'error', 'warn', 'info', 'hint' },
    --     symbols = {
    --       warn = 'W',
    --       error = 'E',
    --       info = 'I',
    --       hint = 'H',
    --     },
    --     diagnostics_color = {
    --       error = 'DiagnosticError',
    --       warn = 'DiagnosticWarn',
    --       info = 'DiagnosticInfo',
    --       hint = 'DiagnosticHint',
    --     },
    --     update_in_insert = false,
    --   },
    -- },
    -- lualine_z = { 'location' },
  },
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
    -- lualine_c = { require('plugin.lualine.tabline_colors') },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
})
