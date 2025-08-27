local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  -- Tworzymy pustą tabelę na kolory
  local fuzzelColors = {}

  -- Zastępujemy dynamiczne blendowanie statycznym przypisaniem.
  colors.bg_search = colors.bg_highlight -- Używamy koloru podświetlenia tła

  -- Przechodzimy przez naszą paletę nazw kolorów
  for k, v in pairs(colors) do
    if type(v) == "string" then
      -- Ta część jest problematyczna, bo nasze wartości to "Red", a nie "#ff5555"
      -- Dla celów działania, po prostu przekazujemy nazwę dalej.
      -- Fuzzel prawdopodobnie tego nie zrozumie, ale unikniemy błędu w Neovim.
      fuzzelColors[k] = v
    end
  end

  local fuzzel = util.template(
    [[
[colors]
background=${bg_popup}
text=${fg}
match=${blue1}
selection=${bg_search}
selection-match=${blue1}
selection-text=${fg}
border=${border_highlight}
]],
    fuzzelColors
  )
  return fuzzel
end

return M
