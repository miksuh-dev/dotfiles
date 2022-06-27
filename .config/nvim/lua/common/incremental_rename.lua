-- Usage: type :IncrementalRename <new_name> while your cursor is placed above an identifier (LSP must be enabled)
-- Note: when an identifier occurs more than once on the same line, the preview is currently only shown for the last occurrence - improvements welcome!
local state = {
  added_lines = false,
  orig_lines = {},
  lsp_positions = {},
}

local function incremental_rename(opts, preview_ns, preview_buf)
  -- Store the lines of the buffer at the first invocation
  if not state.added_lines then
    -- Get positions of LSP reference symbols
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/references', params, function(err, result, _, _)
      if err then
        vim.notify('Error while finding references: ' .. err.message, vim.lsp.log_levels.ERROR)
        return
      end
      if not result or vim.tbl_isempty(result) then
        vim.notify('No results from textDocument/references', vim.lsp.log_levels.WARN)
        return
      end
      state.lsp_positions = vim.tbl_map(function(x)
        return x.range
      end, result)

      local buf = vim.api.nvim_get_current_buf()
      state.orig_lines = {}
      for _, position in ipairs(state.lsp_positions) do
        local line_nr = position.start.line
        local line = vim.api.nvim_buf_get_lines(buf, line_nr, line_nr + 1, 0)[1]
        table.insert(state.orig_lines, { text = line, nr = line_nr })
      end
      state.added_lines = true
    end)
    return
  end

  for i, line in ipairs(state.orig_lines) do
    local positions = state.lsp_positions
    local start_col, end_col = positions[i].start.character, positions[i]['end'].character
    local updated_line = line.text:sub(1, start_col) .. opts.args .. line.text:sub(end_col + 1)
    if preview_ns then
      vim.api.nvim_buf_set_lines(0, line.nr, line.nr + 1, false, { updated_line })
      vim.api.nvim_buf_add_highlight(0, preview_ns, 'Substitute', line.nr, start_col, start_col + #opts.args)
      if preview_buf then
        vim.api.nvim_buf_set_lines(preview_buf, preview_ns, line.nr + 1, false, { updated_line })
        vim.api.nvim_buf_add_highlight(
          preview_buf,
          preview_ns,
          'Substitute',
          line.nr,
          start_col,
          start_col + #opts.args
        )
      end
    end
  end
  if not preview_ns then
    -- Now execute the actual LSP rename command
    vim.lsp.buf.rename(opts.args)
    state.added_lines = false
  end

  if preview_ns then
    return 2
  end
end

-- Create the user command
vim.api.nvim_create_user_command(
  'IncrementalRename',
  incremental_rename,
  { nargs = 1, range = '%', addr = 'lines', preview = incremental_rename }
)
