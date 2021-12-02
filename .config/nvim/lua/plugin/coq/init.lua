local border = require('common.border')

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    pre_select = true,
    recommended = false,
    jump_to_mark = '<C-e>',
  },
  display = {
    ghost_text = {
      enabled = false,
      context = { ' 〈 ', ' 〉' },
      highlight_group = 'Comment',
    },
    pum = {
      fast_close = true,
      y_max_len = 16,
      y_ratio = 0.3,
      x_max_len = 66,
      x_truncate_len = 12,
      ellipsis = '…',
      kind_context = { ' [', ']' },
      source_context = { '[', ']' },
    },
    preview = {
      x_max_len = 88,
      resolve_timeout = 0.09,
      border = border,
      positions = {
        east = 1,
        south = 2,
        north = 3,
        west = 4,
      },
    },
    icons = {
      mode = 'none',
    },
  },
  clients = {
    lsp = {
      enabled = true,
      short_name = 'LSP',
      resolve_timeout = 0.06,
    },
    tags = {
      enabled = true,
      short_name = 'TAG',
      parent_scope = ' ⇊',
      path_sep = ' ⇉ ',
    },
    snippets = {
      enabled = true,
      short_name = 'SNIP',
      user_path = 'lua/plugin/coq/snippets',
      warn = { 'outdated' },
    },
    paths = {
      enabled = true,
      short_name = 'PATH',
      resolution = { 'cwd', 'file' },
      path_seps = { '/', '.' },
      preview_lines = 6,
    },
    tree_sitter = {
      enabled = true,
      short_name = 'TS',
      search_context = 333,
      slow_threshold = 1.0,
      path_sep = ' ⇊',
    },
    buffers = {
      enabled = true,
      short_name = 'BUFF',
      match_syms = false,
      same_filetype = false,
    },

    tmux = {
      enabled = true,
      short_name = 'TMUX',
      match_syms = false,
    },
    tabnine = {
      short_name = 'T9',
      enabled = false,
    },
  },
}
