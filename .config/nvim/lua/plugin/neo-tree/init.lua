local function in_db_ui(filetype)
  return filetype == 'sql' or filetype == 'dbout'
end

local map = vim.keymap.set

map('n', '-', function()
  if vim.bo.filetype == 'dbui' then
    return vim.cmd(':DBUIToggle')
  end

  if in_db_ui(vim.bo.filetype) then
    return vim.cmd(':DBUI')
  end

  vim.cmd(':NeoTreeRevealInSplitToggle')
end)

map('n', '<leader>-', function()
  vim.cmd(':NeoTreeShowInSplitToggle')
end)

-- map('n', '<leader>n', function()
--   if vim.bo.filetype == 'dbui' then
--     return vim.cmd(':DBUIToggle')
--   end
--
--   if in_db_ui(vim.bo.filetype) then
--     return vim.cmd(':DBUI')
--   end
--
--   vim.cmd(':NeoTreeRevealInSplitToggle')
-- end)
--
-- map('n', '<leader>N', function()
--   vim.cmd(':NeoTreeShowInSplitToggle')
-- end)
