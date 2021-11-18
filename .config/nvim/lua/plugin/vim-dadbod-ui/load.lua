local nnoremap = vim.keymap.nnoremap

vim.g.db_ui_use_nerd_fonts = true

vim.g.db_ui_icons = {
  expanded= {
    db= ' ',
    buffers= ' ',
    saved_queries= ' ',
    schemas= ' ',
    schema= ' פּ',
    tables= ' 藺',
    table= ' ',
  },
  collapsed= {
    db= ' ',
    buffers= ' ',
    saved_queries= ' ',
    schemas= ' ',
    schema= ' פּ',
    tables= ' 藺',
    table= ' ',
  },
  saved_query= '',
  new_query= '璘',
  tables= '離',
  buffers= '﬘',
  add_connection= '',
  connection_ok= '✓',
  connection_error= '✕',
}

nnoremap({ '<leader>du', ':DBUI<CR>', silent = true })

vim.cmd[[
  autocmd FileType dbui nmap <buffer> rn <Plug>(DBUI_RenameLine)

  autocmd FileType dbout nmap <buffer> gd <Plug>(DBUI_JumpToForeignKey)
]]

