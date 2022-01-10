local map = vim.keymap.set

vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_winwidth = 40

vim.g.db_ui_icons = {
  expanded = {
    db = ' ',
    buffers = ' ',
    saved_queries = ' ',
    schemas = ' ',
    schema = ' פּ',
    tables = ' 藺',
    table = ' ',
  },
  collapsed = {
    db = ' ',
    buffers = ' ',
    saved_queries = ' ',
    schemas = ' ',
    schema = ' פּ',
    tables = ' 藺',
    table = ' ',
  },
  saved_query = '',
  new_query = '璘',
  tables = '離',
  buffers = '﬘',
  add_connection = '',
  connection_ok = '✓',
  connection_error = '✕',
}

map('n', '<leader>du', ':DBUI<CR>', { silent = true })

vim.cmd([[
  autocmd FileType dbui nmap <buffer> X <Plug>(DBUI_DeleteLine)
  autocmd FileType dbui nmap <buffer> a <Plug>(DBUI_AddConnection)
  autocmd FileType dbui nmap <buffer> R <Plug>(DBUI_Redraw)
  autocmd FileType dbui nmap <buffer> rn <Plug>(DBUI_RenameLine)

  autocmd FileType dbui nmap <buffer> J <Plug>(DBUI_GotoFirstSibling)
  autocmd FileType dbui nmap <buffer> K <Plug>(DBUI_GotoLastSibling)

  autocmd FileType dbui nmap <buffer> < <Plug>(DBUI_GotoPrevSibling)
  autocmd FileType dbui nmap <buffer> > <Plug>(DBUI_GotoNextSibling)

  autocmd FileType dbui nmap <buffer> P <Plug>(DBUI_GotoParentNode)

  autocmd FileType dbout nmap <buffer> gd <Plug>(DBUI_JumpToForeignKey)

]])
