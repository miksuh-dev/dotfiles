require'tabline'.setup {
  -- Defaults configuration options
  enable = true,
  section_separators = {'', ''},
  component_separators = {'', ''},
  options = {
    always_show_tabs = false, -- by default, this shows tabs only when there are more than one tab or if the first tab is named
  }
}

vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

