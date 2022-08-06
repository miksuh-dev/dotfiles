local M = {}

M.declaration = function()
  vim.lsp.buf.declaration()
end

M.definition = function()
  require('telescope.builtin').lsp_definitions({ file_ignore_patterns = {} })
end

M.hover = function()
  vim.lsp.buf.hover()
end

M.implementation = function()
  require('telescope.builtin').lsp_implementations({ file_ignore_patterns = {} })
end

M.type_definition = function()
  require('telescope.builtin').lsp_type_definitions({ file_ignore_patterns = {} })
end

M.reference = function()
  require('telescope.builtin').lsp_references({ file_ignore_patterns = {} })
end

M.signature_help = function()
  vim.lsp.buf.signature_help()
end

M.diagnostics_line = function()
  vim.diagnostic.open_float(0, { scope = 'line' })
end

M.goto_prev = function()
  vim.diagnostic.goto_prev({
    wrap = false,
  })
end

M.goto_next = function()
  vim.diagnostic.goto_next({
    wrap = false,
  })
end

M.set_loc_list = function()
  vim.diagnostic.setloclist()
end

M.code_action = function()
  vim.lsp.buf.code_action()
end

M.range_code_action = function()
  vim.lsp.buf.range_code_action()
end

M.format = function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end

M.range_format = function()
  vim.lsp.buf.range_formatting({ timeout_ms = 5000 })
end

M.rename = function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event

  local curr_name = vim.fn.expand('<cword>')

  local params = vim.lsp.util.make_position_params()

  local function on_submit(new_name)
    if not new_name or #new_name == 0 or curr_name == new_name then
      -- do nothing if `new_name` is empty or not changed.
      return
    end

    -- add `newName` property to `params`.
    -- this is needed for making `textDocument/rename` request.
    params.newName = new_name

    -- send the `textDocument/rename` request to LSP server
    vim.lsp.buf_request(0, 'textDocument/rename', params, function(_, result, ctx, _)
      if not result then
        -- do nothing if server returns empty result
        return
      end

      -- the `result` contains all the places we need to update the
      -- name of the identifier. so we apply those edits.
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)

      -- after the edits are applied, the files are not saved automatically.
      -- let's remind ourselves to save those...
      local total_files = vim.tbl_count(result.changes)
      print(string.format("Changed %s file%s. To save them run ':wa'", total_files, total_files > 1 and 's' or ''))
    end)
  end

  local popup_options = {
    -- border for the window
    border = {
      style = require('common.border'),
      highlight = 'NUIBorderText',
      text = {
        top = ' New name: ',
        top_align = 'left',
      },
    },
    -- highlight for the window.
    -- highlight = 'PmenuSel:PmenuSen',
    -- place the popup window relative to the
    -- buffer position of the identifier
    relative = {
      type = 'buf',
      position = {
        -- this is the same `params` we got earlier
        row = params.position.line,
        col = params.position.character,
      },
    },
    -- position the popup window on the line below identifier
    position = {
      row = 1,
      col = 0,
    },
    -- 25 cells wide, should be enough for most identifier names
    size = {
      width = 25,
      height = 1,
    },
  }

  local input = Input(popup_options, {
    -- set the default value to current name
    default_value = curr_name,
    -- pass the `on,submit` callback function we wrote earlier
    on_submit = on_submit,
    prompt = '',
  })

  input:mount()

  -- close on <esc> in insert mode
  input:map('i', '<esc>', input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return M
