local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local sources = {
  -- Formatting
  null_ls.builtins.formatting.prettierd.with({
    filetypes = {
      'css',
      'scss',
      'graphql',
      'html',
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'typescript',
      'typescript.jsx',
      'typescriptreact',
      'json',
      'markdown',
      'vue',
      'yaml',
    },
  }),
  null_ls.builtins.formatting.stylua.with({
    filetypes = { 'lua' },
    extra_args = { '--indent-type', 'Spaces', '--indent-width', '2', '--quote-style', 'AutoPreferSingle' },
  }),

  -- Code actions
  null_ls.builtins.code_actions.eslint_d.with({
    filetypes = {
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'typescript',
      'typescript.jsx',
      'typescriptreact',
    },

    -- Diagnostics
    null_ls.builtins.diagnostics.eslint_d.with({
      filetypes = {
        'javascript',
        'javascript.jsx',
        'javascriptreact',
        'typescript',
        'typescript.jsx',
        'typescriptreact',
      },
    }),
  }),
}

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  sources = sources,
})
