local prettier = { 'prettierd', 'prettier' }

require('conform').setup({
  formatters_by_ft = {
    css = { prettier },
    scss = { prettier },
    graphql = { prettier },
    html = { prettier },
    javascript = { prettier },
    ['javascript.jsx'] = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    ['typescript.jsx'] = { prettier },
    typescriptreact = { prettier },
    json = { prettier },
    jsonc = { prettier },
    -- lua = { 'stylua' },
    markdown = { prettier },
    yaml = { prettier },
    vue = { prettier },
    rust = { 'rustfmt' },
    robot = { 'robotidy' },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format({ bufnr = args.buf })
  end,
})
