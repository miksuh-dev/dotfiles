require('bqf').setup({
  auto_enable = true, -- enable nvim-bqf in quickfix window automatically,
  magic_window = true, -- give the window magic, when the window is splited horizontally, keep the distance between the current line and the top/bottom border of neovim unchanged. It's a bit like a floating window, but the window is indeed a normal window, without any floating attributes.,
  auto_resize_height = true, -- resize quickfix window height automatically. Shrink higher height to size of list in quickfix window, otherwise extend height to size of list or to default height (10),
  preview = {
    auto_preview = true, -- enable preview in quickfix window automatically,
    border_chars = { '│', '│', '─', '─', '╭', '╮', '╰', '╯', '█' }, -- border and scroll bar chars, they respectively represent: vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar,
    delay_syntax = 50, -- delay time, to do syntax for previewed buffer, unit is millisecond,
    win_height = 20, -- the height of preview window for horizontal layout,
    win_vheight = 15, -- the height of preview window for vertical layout,
    wrap = false, -- wrap the line, `:h wrap` for detail,
    should_preview_cb = nil, -- a callback function to decide whether to preview while switching buffer, with a bufnr parameter,
  },
  -- the table for {function = key},
  func_map = {
    open = '<CR>', -- open the item under the cursor
    openc = 'o', -- like open, and close quickfix window
    tab = 't', -- open the item under the cursor in a new tab
    tabb = 'T', -- like tab, but stay at quickfix window
    split = 's', -- open the item under the cursor in vertical split
    vsplit = 'v', -- open the item under the cursor in horizontal split
    prevhist = '<', -- go to previous quickfix list in quickfix window
    nexthist = '>', -- go to next quickfix list in quickfix window
    stoggleup = '<S-Tab>', -- toggle sign and move cursor up
    stoggledown = '<Tab>', -- toggle sign and move cursor down
    stogglevm = '<Tab>', -- toggle multiple signs in visual mode
    stogglebuf = "'<Tab>", -- toggle signs for same buffers under the cursor
    sclear = 'z<Tab>', -- clear the signs in current quickfix list
    pscrollup = '<C-u>', -- scroll up half-page in preview window
    pscrolldown = '<C-d>', -- scroll down half-page in preview window
    pscrollorig = 'zo', -- scroll back to original postion in preview window
    ptogglemode = 'zp', -- toggle preview window between normal and max size
    ptoggleitem = 'p', -- toggle preview for an item of quickfix list
    ptoggleauto = 'P', -- toggle auto preview when cursor moved
    filter = 'zn', -- create new list for signed items
    filterr = 'zN', -- create new list for non-signed items
    fzffilter = 'zf', -- enter fzf mode
  },
  filter = {
    fzf = {
      action_for = {
        -- ['ctrl-t'] = 'tabedit', -- press ctrl-t to open up the item in a new tab
        -- ['ctrl-v'] = 'vsplit', -- press ctrl-s to open up the item in a new vertical split
        -- ['ctrl-s'] = 'split', -- press ctrl-x to open up the item in a new horizontal split
        ['ctrl-q'] = 'signtoggle', -- press ctrl-q to toggle sign for the selected items
      },
      extra_opts = { '--bind', 'ctrl-o:toggle-all' }, -- extra options for fzf
    },
  },
})
