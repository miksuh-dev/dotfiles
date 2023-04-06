-- local function in_db_ui(filetype)
--   return filetype == 'sql' or filetype == 'dbout'
-- end

local map = vim.keymap.set

map('n', '-', function()
  -- if vim.bo.filetype == 'dbui' then
  --   return vim.cmd(':DBUIToggle')
  -- end

  -- if in_db_ui(vim.bo.filetype) then
  --   return vim.cmd(':DBUI')
  -- end

  vim.fn.setreg('a', vim.fn.getreg('#'))

  local current_file = vim.api.nvim_buf_get_name(0)
  local cwd = vim.loop.cwd()

  local is_file_in_cwd = current_file:sub(0, vim.fn.len(cwd)) == cwd
  if is_file_in_cwd then
    vim.cmd(':Neotree reveal filesystem current')
  else
    vim.cmd(':Neotree filesystem current')
  end
end)

map('n', '<leader>-', function()
  vim.cmd(':Neotree filesystem current')
end)
