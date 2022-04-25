local Menu = require('nui.menu')
local Board = require('kanban.view.board')
local store = require('kanban.store')
local util = require('kanban.util')

local Main = {}
Main.__index = Main

setmetatable(Main, {
  __call = function(cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Main:_init(data, config)
  local board_width = vim.api.nvim_list_uis()[1].width
  local board_height = vim.api.nvim_list_uis()[1].height

  local width = math.floor(board_width * 0.66)
  local height = math.floor(board_height * 0.66)

  local popup_options = {
    relative = 'editor',
    size = {
      width = width,
      height = height,
    },
    position = {
      col = math.floor(board_width / 2 - width / 2),
      row = math.floor(board_height / 2 - height / 2),
    },
    border = {
      style = 'rounded',
      text = {
        top = config.main.title,
        top_align = 'center',
      },
    },
    win_options = {
      winhighlight = 'Normal:Normal',
    },
  }

  local lines = {}
  for _, board in ipairs(data.board) do
    table.insert(lines, Menu.item({ id = tostring(board.id), text = board.name }))
  end

  local menu = Menu(popup_options, {
    lines = lines,
    max_width = 20,
    keymap = {
      focus_next = { 'j', '<Down>', '<Tab>' },
      focus_prev = { 'k', '<Up>', '<S-Tab>' },
      close = { '<Esc>', '<C-c>', 'q' },
      submit = { '<Enter>' },
    },
    on_close = function() end,
    on_submit = function(board)
      self:set_active_board(tonumber(board.id))
    end,
    on_change = function() end,
  })

  self.data = data
  self.config = config
  self.menu = menu

  return self
end

function Main:get_board_data(board_id)
  for index, board in ipairs(self.data.board) do
    if board_id == board.id then
      return index, board
    end
  end
  return nil
end

function Main:update_data(updated_board_data)
  local index, _ = self:get_board_data(updated_board_data.id)
  if index then
    self.data.board[index] = updated_board_data

    store.save_data(self.data, self.config)

    -- TODO: Handle save error
    return self.data
  end
end

function Main:create_board(data)
  local board = Board(self, data, self.config)

  return board
end

function Main:set_active_board(board_id)
  local _, board_data = self:get_board_data(board_id)

  if board_data then
    local board = self:create_board(board_data)

    board:draw()
    self.active_board = board
  end
end

function Main:generate_id(type)
  if type == 'card' then
    return util.generate_card_id(self.data)
  end
end

function Main:draw()
  self.menu:mount()
end

return Main
