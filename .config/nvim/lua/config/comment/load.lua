local util = require('common.util')

-- Comment.nvim supported languages
local ts_context_languages = {
  'javascript',
  'typescript',
  'typescriptreact',
  'react',
  'tsx',
  'css',
  'scss',
  'php',
  'html',
  'svelte',
  'vue',
  'handlebars',
  'glimmer',
  'graphql',
  'lua',
}

require('Comment').setup({
  ---Add a space b/w comment and the line
  ---@type boolean
  padding = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|function
  ignore = nil,

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  ---@type table
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---extra mapping
    ---Includes `gco`, `gcO`, `gcA`
    extra = true,
    ---extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = false,
  },

  ---LHS of toggle mapping in NORMAL + VISUAL mode
  ---@type table
  toggler = {
    ---line-comment keymap
    line = 'gcc',
    ---block-comment keymap
    block = 'gbc',
  },

  ---LHS of operator-pending mapping in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---line-comment keymap
    line = 'gc',
    ---block-comment keymap
    block = 'gb',
  },

  ---Pre-hook, called before commenting the line
  ---@type function|nil
  pre_hook = function(ctx)
    -- Unlink Luasnip so that it doesn't interfere with commenting
    if util.is_plugin_loaded('luasnip') then
      require('luasnip').unlink_current()
    end

    -- Only calculate commentstring for ts_context supported filetypes
    if util.has_value(ts_context_languages, vim.bo.filetype) then
      local U = require('Comment.utils')

      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,

  ---Post-hook, called after commenting is done
  ---@type function|nil
  post_hook = nil,
})

local ft = require('Comment.ft')

-- Add comment support to specific languages
ft.set('robot', '#%s')
