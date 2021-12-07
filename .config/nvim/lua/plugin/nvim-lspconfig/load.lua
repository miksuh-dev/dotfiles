local border = require('common.border')
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap

require('nvim-lsp-installer').settings({
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
})

-- Globally set border for hover
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

-- Globally set border for signatureHelp
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

-- TODO: Check if possible to update after changing buffer
-- (errors form import are not updated on buffer change before going to insert and back)
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    source = 'always',
  },
  update_in_insert = false,
})

local function show_diagnostics()
  vim.lsp.diagnostic.show_line_diagnostics({
    border = border,
  })
end

-- wrapper function to set go_to_prev
local function go_to_prev()
  vim.lsp.diagnostic.goto_prev({
    wrap = false,
    popup_opts = {
      border = border,
    },
  })
end

-- wrapper function to set go_to_next
local function go_to_next()
  vim.lsp.diagnostic.goto_next({
    wrap = false,
    popup_opts = {
      border = border,
    },
  })
end

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  nnoremap({ 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', silent = true })
  nnoremap({ 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', silent = true })
  nnoremap({ 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', silent = true })
  nnoremap({ 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', silent = true })

  nnoremap({ 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', silent = true, buffer = true })

  nnoremap({
    'gr',
    function()
      require('telescope.builtin').lsp_references()
    end,
    silent = true,
    buffer = true,
  })

  nnoremap({ 'H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent = true, buffer = true })
  nnoremap({ '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent = true, buffer = true })
  inoremap({ '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent = true, buffer = true })
  nnoremap({ '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', silent = true, buffer = true })
  nnoremap({ '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', silent = true, buffer = true })
  nnoremap({ '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', silent = true, buffer = true })
  nnoremap({
    '<leader>?',
    show_diagnostics,
    silent = true,
    buffer = true,
  })

  nnoremap({
    '<leader>k',
    go_to_prev,
    silent = true,
    buffer = true,
  })
  nnoremap({ '<leader>j', go_to_next, silent = true, buffer = true })
  nnoremap({ '<leader>J', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', silent = true, buffer = true })

  nnoremap({ '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', silent = true, buffer = true, })
  vnoremap({ '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', silent = true, buffer = true })

  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  -- Format on save is available
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({ timeout_ms = 5000 })]])
    nnoremap({
      '<leader>fo',
      function()
        vim.lsp.buf.formatting({ timeout_ms = 5000 })
      end,
      silent = true,
      buffer = true,
    })
  end

  if client.resolved_capabilities.document_range_formatting then
    vnoremap({
      '<leader>fo',
      function()
        vim.lsp.buf.range_formatting({ timeout_ms = 5000 })
      end,
      noremap = true,
      buffer = true,
    })
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

-- config that activates keymaps and enables snippet support
local function make_config(nvim_lsp)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local root_dir = function(fname)
    return nvim_lsp.util.root_pattern('.git')(fname) or vim.fn.getcwd()
  end

  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
    root_dir = root_dir,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

local function setup_servers()
  local nvim_lsp = require('lspconfig')
  local lsp_installer_servers = require('nvim-lsp-installer')
  local required_servers = require('plugin.nvim-lspconfig.required_servers')

  for _, server in pairs(required_servers) do
    local server_available, requested_server = lsp_installer_servers.get_server(server)
    if server_available then
      requested_server:on_ready(function()
        local config = make_config(nvim_lsp)

        if server == 'efm' then
          local efm_config = require('plugin.nvim-lspconfig.efm')
          config.init_options = { documentFormatting = true, codeAction = true }
          config.root_dir = function(fname)
            return nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')(fname)
              or vim.fn.getcwd()
          end

          config.filetypes = vim.tbl_keys(efm_config)
          config.settings = {
            languages = efm_config,
          }
        end

        if server == 'eslint' then
          config.settings = {
            format = { enable = false },
          }
        end

        if server == 'typescript' then
          config.root_dir = function(fname)
            return nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')(fname)
              or vim.fn.getcwd()
          end

          config.on_attach = function(client, bufnr)
            -- disable tsserver formatting if you plan on formatting via null-ls
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            local ts_utils = require('nvim-lsp-ts-utils')

            -- defaults
            ts_utils.setup({
              debug = false,
              disable_commands = false,
              enable_import_on_completion = false,

              -- import all
              import_all_timeout = 5000, -- ms
              import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
              },
              import_all_scan_buffers = 100,
              import_all_select_source = false,

              -- eslint
              eslint_enable_code_actions = false,
              eslint_enable_disable_comments = false,
              eslint_bin = 'eslint',
              eslint_config_fallback = nil,
              eslint_enable_diagnostics = false,
              eslint_show_rule_id = false,

              -- formatting
              enable_formatting = false,
              formatter = 'prettier',
              formatter_config_fallback = nil,

              auto_inlay_hints = true,
              inlay_hints_highlight = 'Comment',

              -- update imports on file move
              update_imports_on_move = false,
              require_confirmation_on_move = false,
              watch_dir = nil,

              -- filter diagnostics
              filter_out_diagnostics_by_severity = {},
              filter_out_diagnostics_by_code = {},
            })

            -- required to fix code action ranges and filter diagnostics
            ts_utils.setup_client(client)

            -- no default maps, so you may want to define some here
            local opts = { silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'qf', ':TSLspFixCurrent<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<CR>', opts)

            on_attach(client, bufnr)
          end
        end

        if server == 'sumneko_lua' then
          config.settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
              },
              workspace = {
                library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
              },
            },
          }
        end

        if server == 'jsonls' then
          config.settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
            },
          }
        end

        if server == 'vuels' then
          config.root_dir = nvim_lsp.util.root_pattern('tsconfig.json', 'package.json')
        end

        if server == 'graphql' then
          config.autostart = false
          config.filetypes = { 'graphql', 'javascript', 'typescriptreact', 'javascriptreact' }
          config.root_dir = nvim_lsp.util.root_pattern('.graphqlrc*', '.graphql.config.*', 'graphql.conf')
        end

        requested_server:setup(config)
      end)
      if not requested_server:is_installed() then
        requested_server:install()
      end
    end
  end
end

setup_servers()
