local map = vim.keymap.set

map('n', '<Leader>nf', function()
  require('neogen').generate({ type = 'func' })
end, { silent = true })

map('n', '<Leader>nt', function()
  require('neogen').generate({ type = 'type' })
end, { silent = true })

map('n', '<Leader>nc', function()
  require('neogen').generate({ type = 'class' })
end, { silent = true })

map('n', '<Leader>np', function()
  require('neogen').generate({ type = 'file' })
end, { silent = true })
