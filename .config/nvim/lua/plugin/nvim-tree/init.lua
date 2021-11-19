local function is_file_readable(fname)
  local stat = vim.loop.fs_stat(fname)
  return stat and stat.type == 'file' and vim.loop.fs_access(fname, 'R')
end

local function in_db_ui(filetype)
  return filetype == 'sql' or filetype == 'dbout'
end

local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>n',
  function()
    local fn = vim.fn
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      require('nvim-tree').close()
    elseif filetype == 'dbui' then
      vim.cmd(':DBUIToggle')
    elseif in_db_ui(filetype) then
      vim.cmd(':DBUI')
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
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      require('nvim-tree').close()
    else
      require('nvim-tree').focus()
    end
  end,
})
