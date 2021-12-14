local map = vim.api.nvim_set_keymap
local nnoremap = vim.keymap.nnoremap

local opts = { noremap = true }
local optsSilent = { noremap = true, silent = true }

-- Clear search on space
map('n', '<CR>', ':noh<CR><CR>', optsSilent)

-- Keep selection after indent
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- Consist y
map('n', 'Y', 'y$', opts)

-- Window resize
map('n', '<C-Left>', ':vertical resize +3<Cr>', optsSilent)
map('n', '<C-Right>', ':vertical resize -3<CR>', optsSilent)
map('n', '<C-Up>', ':resize +3<CR>', optsSilent)
map('n', '<C-Down>', ':resize -3<CR>', optsSilent)

-- Ignore register
map('n', '<leader>d', '"_d', opts)
map('v', '<leader>d', '"_d', opts)

map('n', '<leader>D', '"_D', opts)
map('v', '<leader>D', '"_D', opts)

map('n', '<leader>c', '"_c', opts)
map('v', '<leader>c', '"_c', opts)

map('n', '<leader>C', '"_C', opts)
map('v', '<leader>C', '"_C', opts)

map('n', '<leader>x', '"_x', opts)
map('v', '<leader>x', '"_x', opts)

map('n', '<leader>X', '"_X', opts)
map('v', '<leader>X', '"_X', opts)

-- Keeping it centered
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mzJ`z', opts)

-- Quick macro
map('n', '<BS>', '@q', opts)

-- Alternate file
map('n', '<Space>', '<C-^>', opts)

-- Jump longer
map('n', '<Up>', '5k', opts)
map('v', '<Up>', '5k', opts)

map('n', '<Down>', '5j', opts)
map('v', '<Down>', '5j', opts)

-- Quick increase/decrease
map('n', '-', '<C-x>', opts)
map('n', '+', '<C-a>', opts)

-- Move visual selection
map('v', '<C-k>', ":m '<-2<CR>gv=gv", opts)
map('v', '<C-j>', ":m '>+1<CR>gv=gv", opts)

-- Source lua file
nnoremap({
  '<leader>so',
  function()
    if vim.bo.filetype == 'lua' then
      vim.cmd(':luafile %')
      print('Sourced ' .. vim.fn.bufname())
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

  nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
  nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
]])
