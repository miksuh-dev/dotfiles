local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local sources = {
  -- Formatting
  null_ls.builtins.formatting.prettierd.with({
    filetypes = require('plugin.null-ls.filetypes.prettierd'),
  }),
  null_ls.builtins.formatting.stylua.with({
    filetypes = { 'lua' },
    extra_args = { '--indent-type', 'Spaces', '--indent-width', '2', '--quote-style', 'AutoPreferSingle' },
  }),

  -- Code actions
  null_ls.builtins.code_actions.eslint_d.with({
    filetypes = require('plugin.null-ls.filetypes.eslint_d'),
  }),

  -- -- Diagnostics
  -- null_ls.builtins.diagnostics.eslint_d.with({
  --   filetypes = require('plugin.null-ls.filetypes.eslint_d'),
  -- }),
}

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            timeout_ms = 2000,
          })
        end,
      })
    end
  end,
  sources = sources,
})
