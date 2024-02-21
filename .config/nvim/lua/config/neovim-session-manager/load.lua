local util = require('common.util')
local Path = require('plenary.path')

require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    'neo-tree',
    'fugitive',
    'dbui',
    'help',
    'dapui_scopes',
    'dapui_breakpoints',
    'dapui_stacks',
    'dapui_watches',
    'dap-repl',
    'dap-float',
  },
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'SessionSavePre',
  group = config_group,
  callback = function()
    local buffers = vim.api.nvim_list_bufs()

    local cwd = vim.fn.getcwd()
    local cwd_len = #cwd

    for _, bufnr in ipairs(buffers) do
      local path = vim.api.nvim_buf_get_name(bufnr)

      if path:sub(0, cwd_len) ~= cwd then
        vim.api.nvim_buf_delete(bufnr, {})
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
  group = config_group,
  callback = function()
    local path = vim.fn.expand('%')
    local in_fugitive = path:match('fugitive://')

    if in_fugitive then
      local filetype = vim.bo.filetype

      path = path:sub(#'fugitive://' + 1)
      path = path:sub(#vim.fn.getcwd() + 1)
      path = path:sub(#path:match('/.git//?../') + 1)

      if not util.is_file(vim.fn.getcwd() .. '/' .. path) then
        print('Could restore file ' .. path)
        return
      end

      vim.cmd('edit ' .. path)

      -- For some reason filetype is not set correctly on edit
      vim.bo.filetype = filetype
    end
  end,
})
