local map = vim.keymap.set

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

vim.g.copilot_filetypes = {
  ['*'] = true,
}

map('i', '<Right>', function()
  local copilot_keys = vim.fn['copilot#Accept']()
  if copilot_keys ~= '' and type(copilot_keys) == 'string' then
    vim.api.nvim_feedkeys(copilot_keys, 'i', true)
  end
end, {
  silent = true,
})
