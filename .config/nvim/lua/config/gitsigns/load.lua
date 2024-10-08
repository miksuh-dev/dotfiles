local function is_ignored_file_name(bufnr)
  local ok, buffname = pcall(vim.api.nvim_buf_get_name, bufnr)
  if not ok then
    return
  end

  local ignored_files = require('config.gitsigns.ignored_files')

  for _, file in ipairs(ignored_files) do
    if string.match(buffname, file) then
      return true
    end
  end
  return false
end

local function is_ignored_file(bufnr)
  return is_ignored_file_name(bufnr)
end

local function refresh_fugive_status()
  vim.cmd([[call fugitive#ReloadStatus()]])
end

require('gitsigns').setup({
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        return ']h'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[h', function()
      if vim.wo.diff then
        return '[h'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map('n', '<leader>hs', function()
      gs.stage_hunk()
      refresh_fugive_status()
    end)
    map('n', '<leader>hu', function()
      gs.reset_hunk()
      refresh_fugive_status()
    end)
    map('v', '<leader>hs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      refresh_fugive_status()
    end)
    map('v', '<leader>hu', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      refresh_fugive_status()
    end)

    map('n', '<leader>hU', function()
      gs.undo_stage_hunk()
      refresh_fugive_status()
    end)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', 'gK', gs.blame_line)

    return not is_ignored_file(bufnr)
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
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 10000,
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
})
