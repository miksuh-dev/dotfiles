vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }

require('nvim-treesitter.configs').setup({
  ensure_installed = require('plugin.nvim-treesitter.languages'),
  highlight = {
    enable = true, -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'bash', 'haskell' },
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  matchup = {
    enable = true,
    disable_virtual_text = true,
  },
  textobjects = {
    swap = {
      enable = true,
      swap_previous = {
        ['<leader><'] = '@parameter.inner',
      },
      swap_next = {
        ['<leader>>'] = '@parameter.inner',
      },
    },
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
        ['ic'] = '@conditional.inner',
        ['ac'] = '@conditional.outer',
        ['il'] = '@loop.inner',
        ['al'] = '@loop.outer',
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ['}'] = '@function.inner',
        [')'] = '@conditional.inner',
      },
      -- goto_next_end = {
      --   [']F'] = '@function.outer',
      -- },
      goto_previous_start = {
        ['{'] = '@function.inner',
        ['('] = '@conditional.inner',
      },
      -- goto_previous_end = {
      --   ['[F'] = '@function.outer',
      -- },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['L'] = '@function.outer',
      },
    },
  },
})
