local cmp = require('cmp')
local luasnip = require('luasnip')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
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
  Function = 'ƒ ',
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
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn['UltiSnips#Anon'](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
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
        nvim_lua = '[NvimLua]',
        ultisnips = '[UltiSnips]',
        luasnip = '[LuaSnip]',
        cmp_tabnine = '[Tabnine]',
        calc = '[Calc]',
        path = '[Path]',
        tmux = '[Tmux]',
        conventionalcommits = '[Coco]',
        ['vim-dadbod-completion'] = '[DB]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'cmp_tabnine' },
    { name = 'tmux' },
    { name = 'calc' },
    { name = 'path' },
    { name = 'conventionalcommits' },
    { name = 'vim-dadbod-completion' },
  },
  documentation = {
    border = require('common.border'),
  },
  experimental = {
    ghost_text = true,
  },
})
