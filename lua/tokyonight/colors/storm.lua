-- Plik: ~/projekty/colorcheme-nvim/colors/storm.lua
-- Zmodyfikowana wersja, aby używać 16 kolorów terminala

---@class Palette
local ret = {
  -- Mapowanie podstawowych kolorów tła i pierwszego planu
  bg = "Black",
  bg_dark = "Black",
  bg_dark1 = "Black",
  fg = "White", -- term7 to twój główny kolor tekstu
  fg_dark = "White",
  fg_gutter = "LightBlack", -- term8 jako nieco jaśniejszy od tła

  -- Mapowanie semantycznych kolorów na nazwy ANSI
  red = "Red",
  green = "Green",
  yellow = "Yellow",
  blue = "Blue",
  purple = "Magenta",
  magenta = "Magenta",
  cyan = "Cyan",
  orange = "LightRed", -- Pomarańczowy mapujemy na jasnoczerwony (term9)

  -- Warianty kolorów: Ponieważ mamy tylko 16 kolorów, wiele wariantów
  -- z tokyonight będzie teraz wyglądać tak samo. To jest oczekiwane zachowanie.
  blue0 = "Blue",
  blue1 = "Cyan",
  blue2 = "Cyan",
  blue5 = "LightBlue",
  blue6 = "LightBlue",
  blue7 = "Blue",
  green1 = "Green",
  green2 = "LightGreen",
  red1 = "Red",
  magenta2 = "LightMagenta",
  teal = "LightCyan",

  -- Mapowanie elementów UI
  comment = "LightBlack", -- term8 (szary) jest idealny dla komentarzy
  bg_highlight = "LightBlack",
  dark3 = "LightBlack",
  dark5 = "LightBlack",
  terminal_black = "LightBlack",

  -- Mapowanie kolorów dla Git
  git = {
    add = "Green",
    change = "Blue",
    delete = "Red",
  },
}
return ret
