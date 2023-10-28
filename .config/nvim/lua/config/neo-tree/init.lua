local map = vim.keymap.set

local function is_current_file_in_cwd()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_cwd = vim.uv.cwd()

  return current_file:sub(0, vim.fn.len(current_cwd)) == current_cwd
end

map('n', '_', function()
  vim.fn.setreg('a', vim.fn.getreg('#'))

  if is_current_file_in_cwd() then
    vim.cmd(':Neotree reveal filesystem current')
  else
    vim.cmd(':Neotree filesystem current reveal_force_cwd')
  end
end)

map('n', '<leader>-', function()
  vim.cmd(':Neotree filesystem current')
end)
