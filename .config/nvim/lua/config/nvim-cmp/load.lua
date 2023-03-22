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
  Reference = ' ',
}

local function getKind(kind)
  local kind_icon = kind_icons[kind] or ''
  return kind_icon .. kind
end

local function copilot_enabled()
  return pcall(vim.fn['copilot#Enabled'])
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end),
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
    ['<Up>'] = cmp.mapping(function()
      if copilot_enabled() then
        cmp.close()
        vim.fn['copilot#Previous']()
      end
    end),
    ['<Down>'] = cmp.mapping(function()
      if copilot_enabled() then
        cmp.close()
        vim.fn['copilot#Next']()
      end
    end),
    ['<Right>'] = cmp.mapping(function(fallback)
      if copilot_enabled() then
        local copilot_keys = vim.fn['copilot#Accept']()

        if copilot_keys ~= '' and type(copilot_keys) == 'string' then
          vim.api.nvim_feedkeys(copilot_keys, 'i', true)
          return
        end
      end

      fallback()
    end),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = getKind(vim_item.kind)

      vim_item.menu = ({
        conventionalcommits = '[CC]',
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        cmp_tabnine = '[Tabnine]',
        nvim_lua = '[NvimLua]',
        luasnip = '[LuaSnip]',
        calc = '[Calc]',
        path = '[Path]',
        tmux = '[Tmux]',
        ['vim-dadbod-completion'] = '[DB]',
        nvim_lsp_signature_help = '[SignatureHelp]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'nvim_lsp_signature_help' },
    { name = 'conventionalcommits' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'tmux' },
    { name = 'calc' },
    { name = 'path' },
    { name = 'vim-dadbod-completion' },
  },
  window = {
    documentation = {
      border = require('common.border'),
    },
  },
  experimental = {
    ghost_text = false,
  },
})
