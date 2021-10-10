vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    'notify',
    'packer',
    'qf',
    '', -- Lsp hover window ignore
  },
  buftype = {
    'terminal',
  },
}

vim.g.nvim_tree_ignore = {} -- empty by default
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
--If 0, do not show the icons for one of 'git' 'folder' and 'files'
--1 by default, notice that if 'files' is 1, it will only display
--if nvim-web-devicons is installed and on your runtimepath.
--if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
--but this will not work when you set indent_markers (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
    deleted = '',
    ignored = '◌',
  },
  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },
  lsp = {
    warning = 'W',
    error = 'E',
    hint = 'H',
    info = 'I',
  },
}

-- Auto refresh on enter
vim.cmd('autocmd BufEnter NERD_tree_* | execute "normal R"')

-- following options are the default
local tree_cb = require('nvim-tree.config').nvim_tree_callback

require('nvim-tree').setup({
  -- disables netrw completely
  disable_netrw = true,
  -- hijack netrw window on startup
  hijack_netrw = true,
  -- open the tree when running this setup function
  open_on_setup = true,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = true,
    icons = {
      hint = 'H',
      info = 'I',
      warning = 'W',
      error = 'E',
    },
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {},
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = {
        { key = { '<CR>', 'e', 'l' }, cb = tree_cb('edit') },
        { key = 'cd', cb = tree_cb('cd') },
        { key = 'E', cb = tree_cb('vsplit') },
        { key = 's', cb = tree_cb('split') },
        { key = 't', cb = tree_cb('tabnew') },
        { key = '<', cb = tree_cb('prev_sibling') },
        { key = '>', cb = tree_cb('next_sibling') },
        { key = 'P', cb = tree_cb('parent_node') },
        { key = 'h', cb = tree_cb('close_node') },
        { key = '<Tab>', cb = tree_cb('preview') },
        { key = 'K', cb = tree_cb('first_sibling') },
        { key = 'J', cb = tree_cb('last_sibling') },
        { key = 'I', cb = tree_cb('toggle_ignored') },
        { key = 'H', cb = tree_cb('toggle_dotfiles') },
        { key = 'R', cb = tree_cb('refresh') },
        { key = 'a', cb = tree_cb('create') },
        { key = 'X', cb = tree_cb('remove') },
        { key = 'rn', cb = tree_cb('rename') },
        { key = 'rN', cb = tree_cb('full_rename') },
        { key = 'dd', cb = tree_cb('cut') },
        { key = 'yy', cb = tree_cb('copy') },
        { key = 'p', cb = tree_cb('paste') },
        { key = 'yn', cb = tree_cb('copy_name') },
        { key = 'yp', cb = tree_cb('copy_path') },
        { key = 'yP', cb = tree_cb('copy_absolute_path') },
        { key = '[c', cb = tree_cb('prev_git_item') },
        { key = ']c', cb = tree_cb('next_git_item') },
        { key = { '<BS>', 'U' }, cb = tree_cb('dir_up') },
        { key = 's', cb = tree_cb('system_open') },
        { key = 'q', cb = tree_cb('close') },
        { key = '?', cb = tree_cb('toggle_help') },
      },
    },
  },
})

local function is_file_readable(fname)
  local stat = vim.loop.fs_stat(fname)
  return stat and stat.type == 'file' and vim.loop.fs_access(fname, 'R')
end

function _G.NvimTreeToggleFind()
  local nvimtree = require('nvim-tree')
  local fn = vim.fn

  if fn.expand('%') == 'NvimTree' then
    nvimtree.close()
  elseif is_file_readable(fn.expand('%')) then
    nvimtree.find_file(true)
  else
    nvimtree.focus()
  end
end

function _G.NvimFocusClose()
  local nvimtree = require('nvim-tree')
  local fn = vim.fn

  if fn.expand('%') == 'NvimTree' then
    nvimtree.close()
  else
    nvimtree.focus()
  end
end

vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>lua NvimTreeToggleFind()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>N', '<Cmd>lua NvimFocusClose()<CR>', { noremap = true })
