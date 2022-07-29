local map = vim.keymap.set

-- map('n', '<leader>h1', function()
--   require('harpoon.mark').set_current_at(1)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h2', function()
--   require('harpoon.mark').set_current_at(2)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h3', function()
--   require('harpoon.mark').set_current_at(3)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h4', function()
--   require('harpoon.mark').set_current_at(4)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h5', function()
--   require('harpoon.mark').set_current_at(5)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h6', function()
--   require('harpoon.mark').set_current_at(6)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h7', function()
--   require('harpoon.mark').set_current_at(7)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h8', function()
--   require('harpoon.mark').set_current_at(8)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h9', function()
--   require('harpoon.mark').set_current_at(9)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>h0', function()
--   require('harpoon.mark').set_current_at(10)
--   vim.cmd(':redrawtabline')
-- end, {
--   silent = true,
-- })
--
-- map('n', '<leader>hh', function()
--   require('harpoon.ui').toggle_quick_menu()
-- end, {
--   silent = true,
-- })

-- map('n', '_', function()
--   require('harpoon.ui').toggle_quick_menu()
-- end, {
--   silent = true,
-- })

-- map('n', '<leader>+', function()
--   require('harpoon.ui').toggle_quick_menu()
-- end, {
--   silent = true,
-- })

-- map('n', '<leader>1', function()
--   require('harpoon.ui').nav_file(1)
-- end, { silent = true })
--
-- map('n', '<leader>2', function()
--   require('harpoon.ui').nav_file(2)
-- end, { silent = true })
--
-- map('n', '<leader>3', function()
--   require('harpoon.ui').nav_file(3)
-- end, { silent = true })
--
-- map('n', '<leader>4', function()
--   require('harpoon.ui').nav_file(4)
-- end, { silent = true })
--
-- map('n', '<leader>5', function()
--   require('harpoon.ui').nav_file(5)
-- end, { silent = true })
--
-- map('n', '<leader>6', function()
--   require('harpoon.ui').nav_file(6)
-- end, { silent = true })
--
-- map('n', '<leader>7', function()
--   require('harpoon.ui').nav_file(7)
-- end, { silent = true })
--
-- map('n', '<leader>8', function()
--   require('harpoon.ui').nav_file(8)
-- end, { silent = true })
--
-- map('n', '<leader>9', function()
--   require('harpoon.ui').nav_file(9)
-- end, { silent = true })
--
-- map('n', '<leader>0', function()
--   require('harpoon.ui').nav_file(10)
-- end, { silent = true })

--- New bindings

map('n', '<leader>H', function()
  require('harpoon.mark').add_file()
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'H", function()
  require('harpoon.mark').set_current_at(1)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'J", function()
  require('harpoon.mark').set_current_at(2)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'K", function()
  require('harpoon.mark').set_current_at(3)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'L", function()
  require('harpoon.mark').set_current_at(4)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'Ö", function()
  require('harpoon.mark').set_current_at(5)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'Y", function()
  require('harpoon.mark').set_current_at(6)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'U", function()
  require('harpoon.mark').set_current_at(7)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'I", function()
  require('harpoon.mark').set_current_at(8)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'O", function()
  require('harpoon.mark').set_current_at(9)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', "'P", function()
  require('harpoon.mark').set_current_at(10)
  vim.cmd(':redrawtabline')
end, {
  silent = true,
})

map('n', '<leader>hh', function()
  require('harpoon.ui').toggle_quick_menu()
end, {
  silent = true,
})

map('n', "'h", function()
  require('harpoon.ui').nav_file(1)
end, { silent = true })

map('n', "'j", function()
  require('harpoon.ui').nav_file(2)
end, { silent = true })

map('n', "'k", function()
  require('harpoon.ui').nav_file(3)
end, { silent = true })

map('n', "'l", function()
  require('harpoon.ui').nav_file(4)
end, { silent = true })

map('n', "'ö", function()
  require('harpoon.ui').nav_file(5)
end, { silent = true })

map('n', "'y", function()
  require('harpoon.ui').nav_file(6)
end, { silent = true })

map('n', "'u", function()
  require('harpoon.ui').nav_file(7)
end, { silent = true })

map('n', "'i", function()
  require('harpoon.ui').nav_file(8)
end, { silent = true })

map('n', "'o", function()
  require('harpoon.ui').nav_file(9)
end, { silent = true })

map('n', "'p", function()
  require('harpoon.ui').nav_file(10)
end, { silent = true })
