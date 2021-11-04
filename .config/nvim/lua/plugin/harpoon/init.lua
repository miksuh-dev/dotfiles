
local nnoremap = vim.keymap.nnoremap

nnoremap({
  '<leader>ha',
  function()
    require("harpoon.mark").add_file()
  end,
})


-- Navigate to file x
nnoremap({
  '<leader>hs',
  function()
    require("harpoon.ui").nav_file(1)
  end,
})

nnoremap({
  '<leader>hd',
  function()
    require("harpoon.ui").nav_file(2)
  end,
})

nnoremap({
  '<leader>hf',
  function()
    require("harpoon.ui").nav_file(3)
  end,
})

nnoremap({
  '<leader>hg',
  function()
    require("harpoon.ui").nav_file(4)
  end,
})


-- Menu
nnoremap({
  '<leader>hh',
  function()
    require("harpoon.ui").toggle_quick_menu()
  end,
})

