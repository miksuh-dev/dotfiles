vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }

require('nvim-treesitter.configs').setup({
  ensure_installed = require('plugin.nvim-treesitter.languages'),
  highlight = {
    enable = true, -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'bash' },
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
})
