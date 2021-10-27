local function is_file_readable(fname)
  local stat = vim.loop.fs_stat(fname)
  return stat and stat.type == 'file' and vim.loop.fs_access(fname, 'R')
end

local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>n',
  function()
    local fn = vim.fn

    if fn.expand('%') == 'NvimTree' then
      require('nvim-tree').close()
    elseif is_file_readable(fn.expand('%')) then
      require('nvim-tree').find_file(true)
    else
      require('nvim-tree').focus()
    end
  end,
})

nnoremap({
  '<leader>N',
  function()
    local fn = vim.fn

    if fn.expand('%') == 'NvimTree' then
      require('nvim-tree').close()
    else
      require('nvim-tree').focus()
    end
  end,
})
