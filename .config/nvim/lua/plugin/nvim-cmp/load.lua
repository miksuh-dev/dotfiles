local cmp = require('cmp')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local kind_icons = {
  Class = ' ',
  Color = ' ',
  Constant = ' ',
  Constructor = ' ',
  Enum = '了 ',
  EnumMember = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = ' ',
  Interface = 'ﰮ ',
  Keyword = ' ',
  Method = 'ƒ ',
  Module = ' ',
  Property = ' ',
  Snippet = '﬌ ',
  Struct = ' ',
  Text = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = ' ',
}

local function getKind(kind)
  local kind_icon = kind_icons[kind] or ''
  return kind_icon .. kind
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if vim.fn['UltiSnips#CanExpandSnippet']() == 1 then
          return vim.fn.feedkeys(t('<C-R>=UltiSnips#ExpandSnippet()<CR>'))
        end

        vim.fn.feedkeys(t('<C-n>'), 'n')
      elseif check_back_space() then
        vim.fn.feedkeys(t('<cr>'), 'n')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.complete_info()['selected'] == -1 and vim.fn['UltiSnips#CanExpandSnippet']() == 1 then
        vim.fn.feedkeys(t('<C-R>=UltiSnips#ExpandSnippet()<CR>'))
      elseif vim.fn['UltiSnips#CanJumpForwards']() == 1 then
        vim.fn.feedkeys(t('<ESC>:call UltiSnips#JumpForwards()<CR>'))
      elseif cmp.visible() then
        vim.fn.feedkeys(t('<C-n>'), 'n')
      elseif check_back_space() then
        vim.fn.feedkeys(t('<tab>'), 'n')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
        return vim.fn.feedkeys(t('<C-R>=UltiSnips#JumpBackwards()<CR>'))
      elseif cmp.visible() then
        vim.fn.feedkeys(t('<C-p>'), 'n')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = getKind(vim_item.kind)

      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        ultisnips = '[UltiSnips]',
        cmp_tabnine = '[Tabnine]',
        calc = '[Calc]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'cmp_tabnine' },
    { name = 'calc' },
    { name = 'path' },
  },
  documentation = {
    border = require('common.border'),
  },
})
