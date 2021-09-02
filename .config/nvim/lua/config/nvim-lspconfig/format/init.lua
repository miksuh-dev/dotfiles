local eslint = require('config.nvim-lspconfig.format.eslint');
local prettier = require('config.nvim-lspconfig.format.prettier');

-- local luaformatter = { formatCommand = "lua-format -i", formatStdin = true }
-- local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

return {
    css = { prettier },
    html = { prettier },
    javascript = { prettier, eslint },
    javascriptreact = { prettier, eslint },
    json = { prettier },
    lua = {},
    markdown = { prettier },
    scss = { prettier },
    typescript = { prettier, eslint },
    typescriptreact = { prettier, eslint },
    yaml = { prettier },
}
