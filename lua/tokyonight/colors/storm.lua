-- Plik: ~/projekty/colorscheme-nvim/colors/storm.lua

---@class Palette
local ret = {
  -- Mapowanie podstawowych kolorów
  bg = 0, -- Black
  bg_dark = 0,
  bg_dark1 = 0,
  fg = 7, -- White
  fg_dark = 7,
  fg_gutter = 8, -- LightBlack/Grey

  -- Mapowanie semantycznych kolorów na numery ANSI
  red = 1,
  green = 2,
  yellow = 3,
  blue = 4,
  purple = 5,
  magenta = 5,
  cyan = 6,
  orange = 9, -- LightRed

  -- Warianty kolorów
  blue0 = 4,
  blue1 = 6, -- Cyan
  blue2 = 6,
  blue5 = 12, -- LightBlue
  blue6 = 12,
  blue7 = 4,
  green1 = 2,
  green2 = 10, -- LightGreen
  red1 = 1,
  magenta2 = 13, -- LightMagenta
  teal = 14, -- LightCyan

  -- Elementy UI
  comment = 8, -- LightBlack
  bg_highlight = 8,
  dark3 = 8,
  dark5 = 8,
  terminal_black = 8,

  -- Git
  git = {
    add = 2, -- Green
    change = 4, -- Blue
    delete = 1, -- Red
  },
}
return ret
