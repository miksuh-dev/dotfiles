local M = {}

-- Base colors generated with:
-- local util = require('common.util')
--
-- local base = '#171717'
-- base2 = util.shade_color(base, 85),
-- base3 = util.shade_color(base, 100),
-- base4 = util.shade_color(base, 150),
-- base5 = util.shade_color(base, 250),
-- base6 = util.shade_color(base, 450),
-- base7 = util.shade_color(base, 600),
-- border = util.shade_color(base, 800),

M.classic = {
  name = 'monokai',
  base2 = '#2a2a2a',
  base3 = '#2e2e2e',
  base4 = '#393939',
  base5 = '#505050',
  base6 = '#7e7e7e',
  base7 = '#a1a1a1',
  border = '#cfcfcf',
  brown = '#504945',
  white = '#f8f8f0',
  grey = '#8F908A',
  black = '#000000',
  blue = '#1793d0',
  pink = '#f92672',
  green = '#a6e22e',
  aqua = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  purple = '#ae81ff',
  red = '#e95678',
  diff_add = '#3d5213',
  diff_remove = '#4a0f23',
  diff_change = '#27406b',
  diff_text = '#23324d',
  none = 'NONE',
}

M.highlight = function(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg = ' .. color.fg or 'guifg = NONE'
  local bg = color.bg and 'guibg = ' .. color.bg or 'guibg = NONE'
  local sp = color.sp and 'guisp = ' .. color.sp or ''
  vim.cmd('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
end

M.load_syntax = function(palette)
  return {
    Normal = {
      fg = palette.white,
      bg = palette.none,
    },
    NormalFloat = {
      bg = palette.base2,
    },
    FloatBorder = {
      fg = palette.border,
      bg = palette.base2,
    },
    Pmenu = {
      fg = palette.white,
      bg = palette.base2,
    },
    PmenuSel = {
      fg = palette.white,
      bg = palette.blue,
      style = 'bold',
    },
    PmenuSelBold = {
      fg = palette.white,
      bg = palette.blue,
      style = 'bold',
    },
    PmenuThumb = {
      fg = palette.purple,
      bg = palette.base7,
    },
    PmenuSbar = {
      bg = palette.base3,
    },
    Cursor = {
      style = 'reverse',
    },
    ColorColumn = {
      bg = palette.base3,
    },
    CursorLine = {
      bg = palette.base4,
    },
    NonText = {
      fg = palette.base5,
    },
    Visual = {
      bg = palette.base5,
    },
    VisualNOS = {
      bg = palette.base3,
    },
    YankVisual = {
      bg = palette.base6,
    },
    Search = {
      fg = palette.base2,
      bg = palette.yellow,
    },
    IncSearch = {
      fg = palette.base2,
      bg = palette.yellow,
    },
    CursorLineNr = {
      fg = palette.aqua,
      bg = palette.base4,
    },
    MatchParen = {
      fg = palette.pink,
    },
    Question = {
      fg = palette.yellow,
    },
    ModeMsg = {
      fg = palette.white,
      style = 'bold',
    },
    MoreMsg = {
      fg = palette.white,
      style = 'bold',
    },
    ErrorMsg = {
      fg = palette.red,
      style = 'bold',
    },
    WarningMsg = {
      fg = palette.yellow,
      style = 'bold',
    },
    VertSplit = {
      fg = palette.base3,
    },
    LineNr = {
      fg = palette.base7,
      bg = palette.none,
    },
    SignColumn = {
      fg = palette.white,
      bg = palette.none,
    },
    StatusLine = {
      fg = palette.base7,
      bg = palette.none,
    },
    StatusLineNC = {
      fg = palette.grey,
      bg = palette.none,
    },
    Tabline = {},
    TabLineFill = {},
    TabLineSel = {
      bg = palette.base4,
    },
    SpellBad = {
      fg = palette.red,
      style = 'undercurl',
    },
    SpellCap = {
      fg = palette.purple,
      style = 'undercurl',
    },
    SpellRare = {
      fg = palette.aqua,
      style = 'undercurl',
    },
    SpellLocal = {
      fg = palette.pink,
      style = 'undercurl',
    },
    SpecialKey = {
      fg = palette.pink,
    },
    Title = {
      fg = palette.yellow,
      style = 'bold',
    },
    Directory = {
      fg = palette.aqua,
    },
    DiffAdd = {
      bg = palette.diff_add,
    },
    DiffDelete = {
      bg = palette.diff_remove,
    },
    DiffChange = {
      bg = palette.diff_change,
    },
    DiffText = {
      bg = palette.diff_text,
    },
    diffAdded = {
      fg = palette.green,
    },
    diffRemoved = {
      fg = palette.pink,
    },
    Folded = {
      fg = palette.base7,
      style = 'bold',
    },
    FoldColumn = {
      fg = palette.white,
      bg = palette.none,
    },
    Constant = {
      fg = palette.aqua,
    },
    Number = {
      fg = palette.purple,
    },
    Float = {
      fg = palette.purple,
    },
    Boolean = {
      fg = palette.purple,
    },
    Character = {
      fg = palette.yellow,
    },
    String = {
      fg = palette.yellow,
    },
    Type = {
      fg = palette.aqua,
    },
    Structure = {
      fg = palette.aqua,
    },
    StorageClass = {
      fg = palette.aqua,
    },
    Typedef = {
      fg = palette.aqua,
    },
    Identifier = {
      fg = palette.white,
    },
    Function = {
      fg = palette.green,
      -- style = 'italic',
      -- style = 'bold',
    },
    Statement = {
      fg = palette.pink,
    },
    Operator = {
      fg = palette.pink,
    },
    Label = {
      fg = palette.pink,
    },
    Keyword = {
      fg = palette.pink,
      -- style = 'italic',
      -- style = 'bold',
    },
    PreProc = {
      fg = palette.green,
    },
    Include = {
      fg = palette.pink,
    },
    Define = {
      fg = palette.pink,
    },
    Macro = {
      fg = palette.pink,
    },
    PreCondit = {
      fg = palette.pink,
    },
    Special = {
      fg = palette.white,
    },
    SpecialChar = {
      fg = palette.pink,
    },
    Delimiter = {
      fg = palette.white,
    },
    SpecialComment = {
      fg = palette.grey,
      style = 'italic',
    },
    Tag = {
      fg = palette.orange,
    },
    Todo = {
      fg = palette.orange,
    },
    Comment = {
      fg = palette.base7,
      style = 'italic',
    },
    Underlined = {
      style = 'underline',
    },
    Ignore = {},
    Error = {
      fg = palette.red,
    },
    Terminal = {
      fg = palette.white,
      bg = palette.base2,
    },
    EndOfBuffer = {
      fg = palette.base5,
      bg = palette.none,
    },
    Conceal = {
      fg = palette.grey,
    },
    vCursor = {
      style = 'reverse',
    },
    iCursor = {
      style = 'reverse',
    },
    lCursor = {
      style = 'reverse',
    },
    CursorIM = {
      style = 'reverse',
    },
    CursorColumn = {
      bg = palette.base3,
    },
    Whitespace = {
      fg = palette.base3,
    },
    WildMenu = {
      fg = palette.white,
      bg = palette.orange,
    },
    QuickFixLine = {
      fg = palette.purple,
      style = 'bold',
    },
    Debug = {
      fg = palette.orange,
    },
    debugBreakpoint = {
      fg = palette.base2,
      bg = palette.red,
    },
    Conditional = {
      fg = palette.pink,
    },
    Repeat = {
      fg = palette.pink,
    },
    Exception = {
      fg = palette.pink,
    },
  }
end

M.load_plugin_syntax = function(palette)
  return {
    TSString = {
      fg = palette.yellow,
    },
    TSInclude = {
      fg = palette.pink,
    },
    TSVariable = {
      fg = palette.white,
    },
    TSVariableBuiltin = {
      fg = palette.orange,
    },
    TSAnnotation = {
      fg = palette.green,
    },
    TSComment = {
      fg = palette.base7,
      style = 'italic',
    },
    TSConstant = {
      fg = palette.aqua,
    },
    TSConstructor = {
      fg = palette.aqua,
    },
    TSConstBuiltin = {
      fg = palette.purple,
    },
    TSConstMacro = {
      fg = palette.purple,
    },
    TSConditional = {
      fg = palette.pink,
    },
    TSCharacter = {
      fg = palette.yellow,
    },
    TSFunction = {
      fg = palette.green,
      -- style = 'italic',
      -- style = 'bold',
    },
    TSFuncBuiltin = {
      fg = palette.aqua,
    },
    TSFuncMacro = {
      fg = palette.green,
      -- style = 'italic',
      -- style = 'bold',
    },
    TSKeyword = {
      fg = palette.pink,
      -- style = 'italic',
      -- style = 'bold',
    },
    TSKeywordFunction = {
      fg = palette.pink,
      -- style = 'italic',
      -- style = 'bold',
    },
    TSKeywordOperator = {
      fg = palette.pink,
    },
    TSKeywordReturn = {
      fg = palette.pink,
    },
    TSMethod = {
      fg = palette.green,
      -- style = 'italic',
      -- style = 'bold',
    },
    TSNamespace = {
      fg = palette.purple,
    },
    TSNumber = {
      fg = palette.purple,
    },
    TSOperator = {
      fg = palette.pink,
    },
    TSParameter = {
      fg = palette.white,
    },
    TSParameterReference = {
      fg = palette.white,
    },
    TSProperty = {
      fg = palette.white,
    },
    TSPunctDelimiter = {
      fg = palette.white,
    },
    TSPunctBracket = {
      fg = palette.white,
    },
    TSPunctSpecial = {
      fg = palette.pink,
    },
    TSRepeat = {
      fg = palette.pink,
    },
    TSStringRegex = {
      fg = palette.purple,
    },
    TSStringEscape = {
      fg = palette.purple,
    },
    TSTag = {
      fg = palette.pink,
    },
    TSTagDelimiter = {
      fg = palette.white,
    },
    TSTagAttribute = {
      fg = palette.green,
    },
    TSLabel = {
      fg = palette.pink,
    },
    TSType = {
      fg = palette.aqua,
    },
    TSException = {
      fg = palette.pink,
    },
    TSField = {
      fg = palette.white,
    },
    TSFloat = {
      fg = palette.purple,
    },
    dbui_tables = {
      fg = palette.white,
    },
    lualine_y_diagnostics_error_normal = {
      fg = palette.red,
    },
    lualine_y_diagnostics_warn_normal = {
      fg = palette.yellow,
    },
    lualine_y_diagnostics_info_normal = {
      fg = palette.white,
    },
    lualine_y_diagnostics_hint_normal = {
      fg = palette.aqua,
    },
    lualine_y_diagnostics_error_0_normal = {
      fg = palette.red,
    },
    lualine_y_diagnostics_warn_0_normal = {
      fg = palette.yellow,
    },
    lualine_y_diagnostics_info_0_normal = {
      fg = palette.white,
    },
    lualine_y_diagnostics_hint_0_normal = {
      fg = palette.aqua,
    },
    DiagnosticError = {
      fg = palette.red,
    },
    DiagnosticWarn = {
      fg = palette.yellow,
    },
    DiagnosticInfo = {
      fg = palette.white,
    },
    DiagnosticHint = {
      fg = palette.aqua,
    },
    DiagnosticSignError = {
      fg = palette.red,
    },
    DiagnosticSignWarn = {
      fg = palette.yellow,
    },
    DiagnosticSignInfo = {
      fg = palette.white,
    },
    DiagnosticSignHint = {
      fg = palette.aqua,
    },
    DiagnosticVirtualTextError = {
      fg = palette.red,
    },
    DiagnosticVirtualTextWarn = {
      fg = palette.yellow,
    },
    DiagnosticVirtualTextInfo = {
      fg = palette.white,
    },
    DiagnosticVirtualTextHint = {
      fg = palette.aqua,
    },
    DiagnosticUnderlineError = {
      style = 'undercurl',
      sp = palette.red,
    },
    DiagnosticUnderlineWarn = {
      style = 'undercurl',
      sp = palette.yellow,
    },
    DiagnosticUnderlineInfo = {
      style = 'undercurl',
      sp = palette.white,
    },
    DiagnosticUnderlineHint = {
      style = 'undercurl',
      sp = palette.aqua,
    },
    CursorWord0 = {
      bg = palette.white,
      fg = palette.black,
    },
    CursorWord1 = {
      bg = palette.white,
      fg = palette.black,
    },
    NvimTreeFolderIcon = {
      fg = palette.blue,
    },
    NvimTreeIndentMarker = {
      fg = palette.blue,
    },
    NvimTreeFolderName = {
      fg = palette.white,
    },
    NvimTreeRootFolder = {
      fg = palette.pink,
    },
    NvimTreeSpecialFile = {
      fg = palette.white,
      style = 'NONE',
    },
    NvimTreeOpenedFile = {
      fg = palette.aqua,
    },
    TelescopeSelection = {
      fg = palette.white,
      bg = palette.blue,
      style = 'bold',
    },
    TelescopeNormal = {
      fg = palette.white,
      bg = palette.none,
    },
    TelescopeMatching = {
      fg = palette.aqua,
    },
    TelescopeBorder = {
      fg = palette.border,
    },
    TelescopePromptBorder = {
      fg = palette.border,
    },
    TelescopePromptCounter = {
      fg = palette.white,
    },
    CmpItemAbbr = {
      fg = palette.base7,
    },
    CmpItemAbbrMatch = {
      fg = palette.white,
    },
    CmpItemAbbrMatchFuzzy = {
      fg = palette.white,
    },
    CmpItemKind = {
      fg = palette.white,
    },
    CmpItemMenu = {
      fg = palette.white,
    },
    CmpItemAbbrDeprecated = {
      fg = palette.white,
    },
    CmpItemKindClass = {
      fg = palette.aqua,
    },
    CmpItemKindColor = {
      fg = palette.orange,
    },
    CmpItemKindConstant = {
      fg = palette.aqua,
    },
    CmpItemKindConstructor = {
      fg = palette.aqua,
    },
    CmpItemKindEnum = {
      fg = palette.aqua,
    },
    CmpItemKindEnumMember = {
      ff = palette.white,
    },
    CmpItemKindField = {
      ff = palette.white,
    },
    CmpItemKindFile = {
      fg = palette.blue,
    },
    CmpItemKindFolder = {
      fg = palette.yellow,
    },
    CmpItemKindReference = {
      fg = palette.yellow,
    },
    CmpItemKindFunction = {
      fg = palette.green,
    },
    CmpItemKindInterface = {
      fg = palette.pink,
    },
    CmpItemKindKeyword = {
      fg = palette.pink,
    },
    CmpItemKindMethod = {
      fg = palette.green,
    },
    CmpItemKindModule = {
      fg = palette.green,
    },
    CmpItemKindProperty = {
      fg = palette.white,
    },
    CmpItemKindSnippet = {
      fg = palette.yellow,
    },
    CmpItemKindStruct = {
      fg = palette.aqua,
    },
    CmpItemKindText = {
      fg = palette.white,
    },
    CmpItemKindUnit = {
      fg = palette.white,
    },
    CmpItemKindValue = {
      fg = palette.white,
    },
    CmpItemKinsdVariable = {
      fg = palette.white,
    },
    NotificationInfo = {
      fg = palette.white,
      bg = palette.base2,
    },
    NotificationError = {
      fg = palette.red,
      bg = palette.base2,
    },
    NotificationWarning = {
      fg = palette.yellow,
      bg = palette.base2,
    },
    LspSignatureActiveParameter = {
      style = 'bold',
      fg = palette.aqua,
      bg = palette.none,
    },
    IndentBlanklineChar = {
      fg = palette.base4,
    },
    IndentBlanklineSpaceChar = {
      fg = palette.white,
    },
    BufferCurrent = {
      fg = palette.current,
      bg = palette.none,
    },
    BufferCurrentIndex = {
      fg = palette.white,
      bg = palette.none,
    },
    BufferCurrentMod = {
      fg = palette.aqua,
      bg = palette.none,
    },
    BufferCurrentSign = {
      fg = palette.white,
      bg = palette.none,
    },
    BufferCurrentTarget = {
      fg = palette.aqua,
      bg = palette.none,
      style = 'bold',
    },
    BufferVisible = {
      fg = palette.white,
      bg = palette.none,
    },
    BufferVisibleIndex = {
      fg = palette.white,
      bg = palette.none,
    },
    BufferVisibleMod = {
      fg = palette.aqua,
      bg = palette.none,
    },
    BufferVisibleSign = {
      fg = palette.white,
      bg = palette.none,
    },
    BufferVisibleTarget = {
      fg = palette.aqua,
      bg = palette.none,
      style = 'bold',
    },
    BufferInactive = {
      fg = palette.base7,
      bg = palette.none,
    },
    BufferInactiveIndex = {
      fg = palette.base7,
      bg = palette.none,
    },
    BufferInactiveMod = {
      fg = palette.aqua,
      bg = palette.none,
    },
    BufferInactiveSign = {
      fg = palette.base7,
      bg = palette.none,
    },
    BufferInactiveTarget = {
      fg = palette.aqua,
      bg = palette.none,
      style = 'bold',
    },
    BufferTabpages = {
      fg = palette.white,
      bg = palette.none,
      style = 'bold',
    },
    BufferTabpageFill = {
      fg = palette.base7,
      bg = palette.none,
    },
    DevIconDefaultVisible = {
      fg = palette.white,
      bg = palette.none,
    },
    DevIconDefaultCurrent = {
      fg = palette.white,
      bg = palette.none,
    },
    BqfPreviewBorder = {
      fg = palette.border,
    },
    netrwDir = {
      fg = palette.aqua,
      style = 'bold',
    },
    netrwClassify = {
      fg = palette.white,
    },
    netrwTreeBar = {
      fg = palette.base6,
    },

    netrwMarkFile = {
      bg = palette.pink,
      fg = palette.white,
    },
  }
end

M.setup = function(palette)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  local used_palette = palette or M.classic
  vim.g.colors_name = used_palette.name
  local syntax = M.load_syntax(used_palette)
  for group, colors in pairs(syntax) do
    M.highlight(group, colors)
  end
  local async_load_plugin = nil
  async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
    local plugin_syntax = M.load_plugin_syntax(used_palette)
    for group, colors in pairs(plugin_syntax) do
      M.highlight(group, colors)
    end
    async_load_plugin:close()
  end))
  async_load_plugin:send()
end

return M
