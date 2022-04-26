vim.keymap.set({ 'v' }, '<Leader>re', function()
  require('react-extract').extract_to_new_file()
end)
