local map = vim.keymap.set

map('n', '<leader>H', function()
  require('harpoon.mark').add_file()
end, {
  silent = true,
})

map('n', '<leader>hh', function()
  require('harpoon.ui').toggle_quick_menu()
end, {
  silent = true,
})

map('n', '_', function()
  require('harpoon.ui').toggle_quick_menu()
end, {
  silent = true,
})

map('n', '<leader>1', function()
  require('harpoon.ui').nav_file(1)
end, { silent = true })

map('n', '<leader>2', function()
  require('harpoon.ui').nav_file(2)
end, { silent = true })

map('n', '<leader>3', function()
  require('harpoon.ui').nav_file(3)
end, { silent = true })

map('n', '<leader>4', function()
  require('harpoon.ui').nav_file(4)
end, { silent = true })

map('n', '<leader>5', function()
  require('harpoon.ui').nav_file(5)
end, { silent = true })

map('n', '<leader>6', function()
  require('harpoon.ui').nav_file(6)
end, { silent = true })

map('n', '<leader>7', function()
  require('harpoon.ui').nav_file(7)
end, { silent = true })

map('n', '<leader>8', function()
  require('harpoon.ui').nav_file(8)
end, { silent = true })

map('n', '<leader>9', function()
  require('harpoon.ui').nav_file(9)
end, { silent = true })

map('n', '<leader>0', function()
  require('harpoon.ui').nav_file(10)
end, { silent = true })

map('n', '<leader>fW', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
end, {
  silent = true,
})
