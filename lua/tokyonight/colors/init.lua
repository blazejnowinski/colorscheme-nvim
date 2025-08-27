local Util = require("tokyonight.util")

local M = {}

---@type table<string, Palette|fun(opts:tokyonight.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    -- Używamy `dofile` zamiast `Util.mod` dla lokalnych plików
    -- To jest bezpieczniejsza metoda w tym kontekście
    local ok, ret = pcall(require, "tokyonight.colors." .. style)
    if not ok then
      vim.notify("Could not load tokyonight style: " .. style, vim.log.levels.ERROR)
      return require("tokyonight.colors.storm") -- W razie błędu załaduj bazę
    end
    return ret
  end,
})

---@param opts? tokyonight.Config
function M.setup(opts)
  opts = require("tokyonight.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  -- Upraszczamy wszystkie dynamicznie generowane kolory.
  -- Zamiast blendowania, przypisujemy statyczne wartości z naszej palety.

  colors.diff = {
    add = colors.green,
    delete = colors.red,
    change = colors.blue,
    text = colors.blue,
  }

  colors.git.ignore = colors.comment
  colors.black = colors.bg
  colors.border_highlight = colors.blue
  colors.border = colors.bg

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable (bez zmian, bo to bazuje na opcjach a nie na blendowaniu)
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = colors.bg_highlight
  colors.bg_search = colors.blue
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  -- Semantyczne mapowanie (bez zmian)
  colors.error = colors.red
  colors.todo = colors.blue
  colors.warning = colors.yellow
  colors.info = colors.cyan
  colors.hint = colors.green

  -- Rainbow - bez zmian, używa kolorów z palety
  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.cyan,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  -- Upraszczamy kolory dla terminala.
  -- Wszystkie 'bright' wersje będą teraz takie same jak normalne.
  --- @class TerminalColors
  colors.terminal = {
    black = colors.bg,
    black_bright = colors.comment, -- Jasnoczarny/szary dla 'bright'
    red = colors.red,
    red_bright = "LightRed",
    green = colors.green,
    green_bright = "LightGreen",
    yellow = colors.yellow,
    yellow_bright = "LightYellow",
    blue = colors.blue,
    blue_bright = "LightBlue",
    magenta = colors.magenta,
    magenta_bright = "LightMagenta",
    cyan = colors.cyan,
    cyan_bright = "LightCyan",
    white = colors.fg,
    white_bright = "White", -- Zakładamy, że fg to jaśniejszy biały
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
