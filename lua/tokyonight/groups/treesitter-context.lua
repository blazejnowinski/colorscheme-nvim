local Util = require("tokyonight.util")

local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@type tokyonight.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    -- Zamiast blendować, używamy koloru tła podświetlenia z naszej palety
    TreesitterContext = { bg = c.bg_highlight },
  }
end

return M
