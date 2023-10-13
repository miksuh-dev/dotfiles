local prettier = { 'prettierd', 'prettier' }

local slow_format_filetypes = { 'json', 'jsonc' }

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
    lua = { 'stylua' },
    markdown = { prettier },
    yaml = { prettier },
    vue = { prettier },
    rust = { 'rustfmt' },
    robot = { 'robotidy' },
  },
  formatters = {
    stylua = {
      command = 'stylua',
      args = { '-s', '--indent-type', 'Spaces', '--indent-width', '2', '--quote-style', 'AutoPreferSingle', '-' },
    },
  },
  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match('timeout$') then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 200, lsp_fallback = true }, on_format
  end,
  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_fallback = true }
  end,
})
