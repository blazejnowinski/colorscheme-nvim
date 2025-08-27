local Util = require("tokyonight.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type tokyonight.HighlightsFn
function M.get(c, opts)
  -- Zastępujemy dynamiczne blendowanie statycznym przypisaniem.
  -- Po prostu użyjemy koloru, który już mamy w palecie.
  local dark = opts.styles.sidebars == "transparent" and c.none or c.bg_dark

  -- stylua: ignore
  return {
    NeoTreeDimText             = { fg = c.fg_gutter },
    NeoTreeFileName            = { fg = c.fg_sidebar },
    NeoTreeGitModified         = { fg = c.orange },
    NeoTreeGitStaged           = { fg = c.green },
    NeoTreeGitUntracked        = { fg = c.magenta },
    NeoTreeNormal              = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeNormalNC            = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeTabActive           = { fg = c.blue, bg = c.bg_dark, bold = true },
    NeoTreeTabInactive         = { fg = c.comment, bg = dark },
    NeoTreeTabSeparatorActive  = { fg = c.blue, bg = c.bg_dark },
    NeoTreeTabSeparatorInactive= { fg = c.bg, bg = dark },
  }
end

return M
