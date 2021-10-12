local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev(({ wrap = false }))<CR>', opts)
  buf_set_keymap('n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next({ wrap = false })<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  -- Format on save is available
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({ timeout_ms = 5000 })]])
    buf_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting({ timeout_ms = 5000 })<CR>', { noremap = true })
  end

  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(
      'v',
      '<leader>fo',
      '<cmd>lua vim.lsp.buf.range_formatting({ timeout_ms = 5000 })<CR>',
      { noremap = true }
    )
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
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

local function hasValue(tbl, str)
  local f = false
  for i = 1, #tbl do
    if type(tbl[i]) == 'table' then
      f = hasValue(tbl[i], str) --  return value from recursion
      if f then
        break
      end --  if it returned true, break out of loop
    elseif tbl[i] == str then
      return true
    end
  end
  return f
end

local function install_missing(installed_servers)
  local required_servers = {
    'efm',
    'haskell',
    'vim',
    'html',
    'dockerfile',
    'css',
    'graphql',
    'php',
    'typescript',
    'json',
    'bash',
    'yaml',
    'lua',
  }

  local installed = false
  for _, server in pairs(required_servers) do
    if not hasValue(installed_servers, server) then
      require('lspinstall').install_server(server)
      installed = true
    end
  end
  return installed
end

-- lsp-install
local function setup_servers()
  require('lspinstall').setup()

  -- get all installed servers
  local servers = require('lspinstall').installed_servers()

  local installed = install_missing(servers)
  if installed then
    return
  end

  local nvim_lsp = require('lspconfig')

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == 'efm' then
      local format_config = require('config.nvim-lspconfig.format')
      config.init_options = { documentFormatting = true, codeAction = true }
      config.root_dir = function(fname)
        return nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')(fname)
          or vim.fn.getcwd()
      end

      config.filetypes = vim.tbl_keys(format_config)
      config.settings = {
        languages = format_config,
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
          eslint_enable_code_actions = true,
          eslint_enable_disable_comments = true,
          eslint_bin = 'eslint',
          eslint_config_fallback = nil,
          eslint_enable_diagnostics = false,
          eslint_show_rule_id = false,

          -- formatting
          enable_formatting = false,
          formatter = 'prettier',
          formatter_config_fallback = nil,

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

    if server == 'lua' then
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

    -- if server == 'graphql' then
    --   config.filetypes = { 'graphql', 'javascript' }
    --   config.root_dir = nvim_lsp.util.root_pattern('.graphqlrc*', '.graphql.config.*')
    -- end

    nvim_lsp[server].setup(config)
  end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

setup_servers()

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = false })
