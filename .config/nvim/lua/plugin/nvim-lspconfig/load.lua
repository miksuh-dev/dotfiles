require('plugin.nvim-lspconfig.global')

local nvim_lsp = require('lspconfig')
local lsp_installer_servers = require('nvim-lsp-installer')
local required_servers = require('plugin.nvim-lspconfig.required_servers')

local on_attach = require('plugin.nvim-lspconfig.attach')

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local root_dir = function(fname)
    return nvim_lsp.util.root_pattern('.git')(fname) or vim.fn.getcwd()
  end

  return {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = root_dir,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

for _, server in pairs(required_servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(server)

  if server_available then
    requested_server:on_ready(function()
      local config = make_config()

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
        config.handlers = {
          ['eslint/noLibrary'] = function()
            vim.notify('ESLint missing from project', vim.log.levels.INFO)
            return {}
          end,
        }
        config.settings = {
          format = {
            enable = true,
          },
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

      if server == 'grammarly' then
        config.filetypes = { 'txt', 'markdown' }
        config.root_dir = function(fname)
          return nvim_lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')(fname)
            or vim.fn.getcwd()
        end
      end

      if server == 'graphql' then
        config.autostart = false

        config.filetypes = { 'graphql', 'javascript' }
        config.root_dir = function(fname)
          return nvim_lsp.util.root_pattern('graphql.config.json')(fname) or vim.fn.getcwd()
        end
      end

      requested_server:setup(config)
    end)
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end
