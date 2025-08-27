-- Zastępujemy całą zawartość pliku tą uproszczoną wersją.
return function(opts)
  -- Po prostu ładujemy naszą zmodyfikowaną paletę storm,
  -- która teraz zawiera nazwy kolorów terminala.
  -- Ignorujemy całą logikę odwracania.
  ---@type Palette
  local colors = require("tokyonight.colors.storm")
  return colors
end
