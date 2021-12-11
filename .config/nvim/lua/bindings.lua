local nnoremap = vim.keymap.nnoremap

local opts = { noremap = true }
local optsSilent = { noremap = true, silent = true }

-- Clear search on space
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', optsSilent)

-- Keep selection after indent
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- Consist y
vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)

-- Window resize
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +3<Cr>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -3<CR>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +3<CR>', optsSilent)
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -3<CR>', optsSilent)

-- Ignore register
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', opts)
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', opts)

vim.api.nvim_set_keymap('n', '<leader>D', '"_D', opts)
vim.api.nvim_set_keymap('v', '<leader>D', '"_D', opts)

vim.api.nvim_set_keymap('n', '<leader>c', '"_c', opts)
vim.api.nvim_set_keymap('v', '<leader>c', '"_c', opts)

vim.api.nvim_set_keymap('n', '<leader>C', '"_C', opts)
vim.api.nvim_set_keymap('v', '<leader>C', '"_C', opts)

vim.api.nvim_set_keymap('n', '<leader>x', '"_x', opts)
vim.api.nvim_set_keymap('v', '<leader>x', '"_x', opts)

vim.api.nvim_set_keymap('n', '<leader>X', '"_X', opts)
vim.api.nvim_set_keymap('v', '<leader>X', '"_X', opts)

-- Keeping it centered
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- Quick macro
vim.api.nvim_set_keymap('n', '<Space>', '@q', opts)

-- Alternate file
vim.api.nvim_set_keymap('n', '<BS>', '<C-^>', opts)

-- Jump longer
vim.api.nvim_set_keymap('n', '<Up>', '5k', opts)
vim.api.nvim_set_keymap('v', '<Up>', '5k', opts)

vim.api.nvim_set_keymap('n', '<Down>', '5j', opts)
vim.api.nvim_set_keymap('v', '<Down>', '5j', opts)

-- Quick increase/decrease
vim.api.nvim_set_keymap('n', '-', '<C-x>', opts)
vim.api.nvim_set_keymap('n', '+', '<C-a>', opts)

-- Source lua file
nnoremap({
  '<leader>so',
  function()
    if vim.bo.filetype == 'lua' then
      vim.cmd(':luafile %')
    end
  end,
  silent = true,
})

-- TODO: Change this to lua
vim.cmd([[
  nnoremap <expr> ' "'" . nr2char(getchar()) . "zz"
  nnoremap <expr> ` "`" . nr2char(getchar()) . "zz"
]])

-- TODO: Change this to lua
vim.cmd([[
  function! s:GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
  endfunction

  function! ToggleLocationList()
    let curbufnr = winbufnr(0)
    for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Location List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
      if curbufnr == bufnum
        lclose
        return
      endif
    endfor

    let winnr = winnr()
    let prevwinnr = winnr("#")

    let nextbufnr = winbufnr(winnr + 1)
    try
      lopen
    catch /E776/
        echohl ErrorMsg
        echo "Location List is Empty."
        echohl None
        return
    endtry
    if winbufnr(0) == nextbufnr
      lclose
      if prevwinnr > winnr
        let prevwinnr-=1
      endif
    else
      if prevwinnr > winnr
        let prevwinnr+=1
      endif
    endif
    " restore previous window
    exec prevwinnr."wincmd w"
    exec winnr."wincmd w"
  endfunction

  function! ToggleQuickfixList()
    for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
      if bufwinnr(bufnum) != -1
        cclose
        return
      endif
    endfor
    copen
  endfunction

  nmap <script> <silent> <c-q> :call ToggleQuickfixList()<CR>
  nmap <script> <silent> <leader>q :call ToggleLocationList()<CR>
]])
