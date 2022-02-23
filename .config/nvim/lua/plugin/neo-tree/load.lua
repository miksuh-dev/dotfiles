vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E ', texthl = 'LspDiagnosticsSignError' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W ', texthl = 'LspDiagnosticsSignWarning' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I ', texthl = 'LspDiagnosticsSignInformation' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', texthl = 'LspDiagnosticsSignHint' })

require('neo-tree').setup({
  popup_border_style = require('common.border'),
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0, -- extra padding on left hand side
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      default = '*',
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
    components = {
      harpoon_index = function(config, node)
        local Marked = require('harpoon.mark')
        local path = node:get_id()
        local succuss, index = pcall(Marked.get_index_of, path)
        if succuss and index and index > 0 then
          return {
            text = string.format(' -> %d', index),
            highlight = config.highlight or 'NeoTreeDirectoryIcon',
          }
        else
          return {}
        end
      end,
    },
    commands = {
      expand_folder = function(state)
        local node = state.tree:get_node()

        if node.type == 'directory' then
          if not node:is_expanded() then
            local cmds = require('neo-tree.sources.filesystem.commands')
            return cmds.open(state)
          end
        end
      end,
      collapse_folder = function(state)
        local node = state.tree:get_node()

        if node.type == 'directory' then
          if node:is_expanded() then
            local cmds = require('neo-tree.sources.filesystem.commands')
            return cmds.close_node(state)
          end
        end
      end,
      open_without_folder_collapse = function(state)
        local node = state.tree:get_node()
        local cmds = require('neo-tree.sources.filesystem.commands')

        if node.type == 'file' then
          -- Close keeping alternate_file
          local buffnr = vim.fn.bufnr()
          local alternate_file = vim.fn.getreg('#')

          cmds.open(state)

          vim.api.nvim_buf_delete(buffnr, {})
          vim.fn.setreg('#', alternate_file)

          return
        end

        if node.type == 'directory' then
          if not node:is_expanded() then
            return cmds.open(state)
          end
        end
      end,
    },
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
        { 'harpoon_index' },
        { 'clipboard' },
        { 'diagnostics' },
        { 'git_status' },
      },
    },
    window = {
      popup = {
        size = {
          width = '100%',
          height = '100%',
        },
        border = { '' },
      },
      position = 'left',
      mappings = {
        -- Disable default
        ['<2-LeftMouse>'] = 'none',
        ['S'] = 'none',
        ['/'] = 'none',
        ['c'] = 'none',
        ['x'] = 'none',
        ['d'] = 'none',
        ['C'] = 'none',
        ['<bs>'] = 'none',
        ['.'] = 'none',
        ['r'] = 'none',
        ['f'] = 'none',
        ['<c-x>'] = 'none',
        ['y'] = 'none',

        ['<cr>'] = 'open_without_folder_collapse',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['l'] = 'expand_folder',
        ['h'] = 'collapse_folder',
        ['U'] = 'navigate_up',
        ['cd'] = 'set_root',
        ['H'] = 'toggle_hidden',
        ['I'] = 'toggle_gitignore',
        ['R'] = 'refresh',
        -- ['/'] = 'fuzzy_finder',
        -- ['/'] = 'filter_as_you_type', -- this was the default until v1.28
        -- ['f'] = 'filter_on_submit',
        -- ['<c-x>'] = 'clear_filter',
        ['a'] = 'add',
        ['X'] = 'delete',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      position = 'left',
      mappings = {
        -- Disable default
        ['x'] = 'none',
        ['c'] = 'none',
        ['d'] = 'none',
        ['<2-LeftMouse>'] = 'none',
        ['S'] = 'none',
        ['<bs>'] = 'none',
        ['.'] = 'none',
        ['r'] = 'none',
        ['y'] = 'none',

        -- ['l'] = 'expand_folder',
        -- ['h'] = 'collapse_folder',
        ['<cr>'] = 'open',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['U'] = 'navigate_up',
        ['cd'] = 'set_root',
        ['R'] = 'refresh',
        ['a'] = 'add',
        ['X'] = 'delete',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        -- ['p'] = 'paste_from_clipbord',
        ['bd'] = 'buffer_delete',
      },
    },
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        -- Disable default
        ['<2-LeftMouse>'] = 'none',
        ['S'] = 'none',
        ['C'] = 'none',
        ['d'] = 'none',
        ['r'] = 'none',
        ['c'] = 'none',
        ['x'] = 'none',
        ['y'] = 'none',

        -- Disable git
        ['A'] = 'none',
        ['gu'] = 'none',
        ['ga'] = 'none',
        ['gr'] = 'none',
        ['gc'] = 'none',
        ['gp'] = 'none',
        ['gg'] = 'none',
        -- ['A'] = 'git_add_all',
        -- ['gu'] = 'git_unstage_file',
        -- ['ga'] = 'git_add_file',
        -- ['gr'] = 'git_revert_file',
        -- ['gc'] = 'git_commit',
        -- ['gp'] = 'git_push',
        -- ['gg'] = 'git_commit_and_push',

        -- ['<cr>'] = 'open_without_folder_collapse',
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        -- ['l'] = 'expand_folder',
        -- ['h'] = 'collapse_folder',
        ['R'] = 'refresh',
        ['X'] = 'delete',
        ['rn'] = 'rename',
        ['yy'] = 'copy_to_clipboard',
        ['dd'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
      },
    },
  },
})
