local Util = require("tokyonight.util")

local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type tokyonight.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NotifyBackground  = { fg = c.fg, bg = c.bg },
    NotifyDEBUGBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    -- Zamiast blendowania, używamy po prostu koloru bazowego
    NotifyDEBUGBorder = { fg = c.comment, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment },
    NotifyERRORBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyERRORBorder = { fg = c.error, bg = opts.transparent and c.none or c.bg },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error },
    NotifyINFOBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyINFOBorder  = { fg = c.info, bg = opts.transparent and c.none or c.bg },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info },
    NotifyTRACEBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = c.purple, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEIcon   = { fg = c.purple },
    NotifyTRACETitle  = { fg = c.purple },
    NotifyWARNBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyWARNBorder  = { fg = c.warning, bg = opts.transparent and c.none or c.bg },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning },
  }
end

return M
