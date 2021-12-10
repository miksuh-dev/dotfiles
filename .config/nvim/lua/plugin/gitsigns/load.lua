--- Disabled on files
--- % = escape
local ignored_files = {
  'package.json',
  'package%-lock.json',
  'fugitive',
}

local function is_ignored_file(buffname)
  for _, file in ipairs(ignored_files) do
    if string.match(buffname, file) then
      return true
    end
  end
  return false
end

require('gitsigns').setup({
  signs = {
    add = { hl = 'GreenSign', text = '+', numhl = 'GitSignsAddNr' },
    change = { hl = 'BlueSign', text = '~', numhl = 'GitSignsChangeNr' },
    delete = { hl = 'RedSign', text = '-', numhl = 'GitSignsDeleteNr' },
    topdelete = { hl = 'RedSign', text = '-', numhl = 'GitSignsDeleteNr' },
    changedelete = { hl = 'BlueSign', text = '~', numhl = 'GitSignsChangeNr' },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
    ['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

    -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    -- ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    -- ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    -- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    -- ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    -- ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  },
  on_attach = function(bufnr)
    local buffname = vim.api.nvim_buf_get_name(bufnr)
    return not is_ignored_file(buffname)
  end,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  diff_opts = {
    internal = true, -- If vim.diff or luajit is present
  },
  yadm = {
    enable = false,
  },
})

vim.cmd([[
  highlight RedSign guifg=#cc241d ctermfg=124 gui=NONE cterm=NONE guibg=NONE
  highlight YellowSign guifg=#e6db74 ctermfg=214 gui=NONE cterm=NONE guibg=NONE
  highlight GreenSign guifg=#a6e22e ctermfg=142 gui=NONE cterm=NONE guibg=NONE
  highlight BlueSign guifg=#66d9ef ctermfg=142 gui=NONE cterm=NONE guibg=NONE
]])
