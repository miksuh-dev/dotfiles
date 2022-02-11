vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E ', texthl = 'LspDiagnosticsSignError' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W ', texthl = 'LspDiagnosticsSignWarning' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I ', texthl = 'LspDiagnosticsSignInformation' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', texthl = 'LspDiagnosticsSignHint' })

require('neo-tree').setup({
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0, -- extra padding on left hand side
      with_markers = false,
      indent_marker = '│',
      last_indent_marker = '│',
      highlight = 'NeoTreeIndentMarker',
    },
    icon = {
      folder_closed = ' ',
      folder_open = ' ',
      default = '',
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
    },
    git_status = {
      -- highlight = 'NeoTreeDimText', -- if you remove this the status will be colorful
    },
  },
  filesystem = {
    filters = { --These filters are applied to both browsing and searching
      show_hidden = true,
      respect_gitignore = false,
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    use_libuv_file_watcher = false, -- This will use the OS level file watchers
    -- to detect changes instead of relying on nvim autocmd events.
    hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_split",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    renderers = {
      directory = {
        { 'indent' },
        { 'icon' },
        {
          'name',
          use_git_status_colors = true,
          trailing_slash = true,
        },
        { 'diagnostics' },
        { 'clipboard' },
      },
      file = {
        { 'indent' },
        { 'icon' },
        {
          'name',
          use_git_status_colors = true,
        },
        { 'clipboard' },
        { 'diagnostics' },
        { 'git_status' },
      },
    },
    window = {
      position = 'left',
      width = 40,
      mappings = {
        ['<cr>'] = 'open',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['U'] = 'navigate_up',
        ['cd'] = 'set_root',
        ['H'] = 'toggle_hidden',
        ['I'] = 'toggle_gitignore',
        ['R'] = 'refresh',
        -- ['/'] = 'fuzzy_finder',
        -- ['/'] = 'filter_as_you_type', -- this was the default until v1.28
        ['/'] = 'none', -- Assigning a key to "none" will remove the default mapping
        ['c'] = 'none',
        -- ['f'] = 'filter_on_submit',
        -- ['<c-x>'] = 'clear_filter',
        ['a'] = 'add',
        ['X'] = 'delete',
        ['d'] = 'none',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
        ['<leader>n'] = 'close_window',
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      position = 'left',
      mappings = {
        ['l'] = 'open',
        ['<cr>'] = 'open',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['U'] = 'navigate_up',
        ['cd'] = 'set_root',
        ['c'] = 'none',
        ['R'] = 'refresh',
        ['a'] = 'add',
        ['X'] = 'delete',
        ['d'] = 'none',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipbord',
        ['bd'] = 'buffer_delete',
        ['<leader>n'] = 'close_window',
      },
    },
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['<2-LeftMouse>'] = 'open',
        ['<cr>'] = 'open',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['h'] = 'close_node',
        ['R'] = 'refresh',
        ['X'] = 'delete',
        ['d'] = 'none',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['A'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },
  },
})
