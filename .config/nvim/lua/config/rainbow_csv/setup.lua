vim.g.rcsv_delimiters = { '|', '\t', ',', ';' }
vim.g.disable_rainbow_key_mappings = 1

vim.cmd([[
  autocmd FileType csv nmap <buffer> <leader>d :RainbowDelim<CR>
  autocmd FileType csv nmap <buffer> <leader>a :RainbowAlign<CR>
  autocmd FileType csv nmap <buffer> <leader>s :RainbowShrink<CR>
]])
