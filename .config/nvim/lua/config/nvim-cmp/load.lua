local cmp = require('cmp')
local luasnip = require('luasnip')

local kind_icons = {
  Class = ' ',
  Color = '● ',
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
  Snippet = '﬌ ',
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
    format = function(entry, item)
      item.kind = getKind(item.kind)

      item.menu = ({
        conventionalcommits = '[CC]',
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        ['cmp-tw2css'] = '[TW2CSS]',
        cmp_tabnine = '[Tabnine]',
        nvim_lua = '[NvimLua]',
        luasnip = '[LuaSnip]',
        calc = '[Calc]',
        path = '[Path]',
        tmux = '[Tmux]',
        ['vim-dadbod-completion'] = '[DB]',
        nvim_lsp_signature_help = '[SignatureHelp]',
      })[entry.source.name]
      return item
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
    { name = 'cmp-tw2css' },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,

      -- from cmp-under-comparator
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find('^_+')
        local _, entry2_under = entry2.completion_item.label:find('^_+')
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0

        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
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

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
