local map = vim.keymap.set

local function get_fugitive_buff_type(bufnr)
  local path = vim.fn.bufname(bufnr)
  local filetype = vim.bo[bufnr].filetype

  if filetype == 'fugitive' then
    return 'status'
  end

  if filetype == 'fugitiveblame' then
    return filetype
  end

  if path:find('fugitive://') ~= nil then
    return 'diff'
  end

  return nil
end

local function close_diff_buffers()
  local buffers = vim.fn.getwininfo()

  for _, buffer in pairs(buffers) do
    local type = get_fugitive_buff_type(buffer.bufnr)
    if type == 'diff' then
      vim.api.nvim_buf_delete(buffer.bufnr, {})
    end
  end
end

-- TODO Refactor these at some point
-- Temporary solution: prevents multiple diffs and cursor jumping
map('n', '<leader>gd', function()
  -- Do not open on non-git dirs
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') == 0 then
    print('File does not belong to a Git repository.')
    return
  end

  local current_type = get_fugitive_buff_type(vim.fn.bufnr())
  local cursor = vim.api.nvim_win_get_cursor(0)
  local window = vim.api.nvim_get_current_win()

  close_diff_buffers()

  vim.cmd(':Gvdiffsplit')

  if current_type == 'diff' then
    vim.api.nvim_win_set_cursor(0, cursor)
  else
    vim.api.nvim_set_current_win(window)
  end
end, { silent = true })

map('n', '<leader>gD', function()
  -- Do not open on non-git dirs
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') == 0 then
    print('File does not belong to a Git repository.')
    return
  end

  local current_type = get_fugitive_buff_type(vim.fn.bufnr())
  local cursor = vim.api.nvim_win_get_cursor(0)
  local window = vim.api.nvim_get_current_win()

  close_diff_buffers()

  vim.cmd(':Ghdiffsplit')

  if current_type == 'diff' then
    vim.api.nvim_win_set_cursor(0, cursor)
  else
    vim.api.nvim_set_current_win(window)
  end
end, { silent = true })

map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gj', ':diffget //3<CR>')

map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
map('n', '<leader>ge', ':Gedit<CR>', { silent = true })

map('n', '<leader>gs', function()
  -- Close if fugitive window
  if vim.bo.filetype == 'fugitive' then
    vim.cmd(':q')
    return
  end

  -- Do not open on non-git dirs
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') == 0 then
    print('File does not belong to a Git repository.')
    return
  end

  vim.cmd(':15split|0Git')
end, {
  silent = true,
})

map('n', '<leader>gb', function()
  if vim.bo.filetype ~= 'fugitiveblame' then
    local success = pcall(vim.cmd, ':Git blame')
    if not success then
      print('File does not belong to a Git repository.')
    end
  else
    vim.cmd(':q')
  end
end, {
  silent = true,
})
