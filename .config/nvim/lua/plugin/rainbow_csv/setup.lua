vim.g.rcsv_delimiters = { '|', '\t', ',', ';' }
vim.g.disable_rainbow_key_mappings = 1

vim.cmd([[
  autocmd BufNewFile,BufRead *.csv   set filetype=csv_pipe
]])
