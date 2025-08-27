local Util = require("tokyonight.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type tokyonight.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SnacksNotifierDebug       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderDebug = { fg = c.comment, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconDebug   = { fg = c.comment },
    SnacksNotifierTitleDebug  = { fg = c.comment },
    SnacksNotifierError       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderError = { fg = c.error, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconError   = { fg = c.error },
    SnacksNotifierTitleError  = { fg = c.error },
    SnacksNotifierInfo        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderInfo  = { fg = c.info, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconInfo    = { fg = c.info },
    SnacksNotifierTitleInfo   = { fg = c.info },
    SnacksNotifierTrace       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderTrace = { fg = c.purple, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconTrace   = { fg = c.purple },
    SnacksNotifierTitleTrace  = { fg = c.purple },
    SnacksNotifierWarn        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderWarn  = { fg = c.warning, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconWarn    = { fg = c.warning },
    SnacksNotifierTitleWarn   = { fg = c.warning },
    -- Dashboard
    SnacksDashboardDesc       = { fg = c.cyan },
    SnacksDashboardFooter     = { fg = c.blue1 },
    SnacksDashboardHeader     = { fg = c.blue },
    SnacksDashboardIcon       = { fg = c.blue1 },
    SnacksDashboardKey        = { fg = c.orange },
    SnacksDashboardSpecial    = { fg = c.purple },
    SnacksDashboardDir        = { fg = c.comment },
    -- Profiler
    -- Upraszczamy grupy, które używały blendowania
    SnacksProfilerIconInfo    = { bg = c.bg_dark, fg = c.blue1 },
    SnacksProfilerBadgeInfo   = { bg = c.bg_dark, fg = c.blue1 },
    SnacksScratchKey          = "SnacksProfilerIconInfo",
    SnacksScratchDesc         = "SnacksProfilerBadgeInfo",
    SnacksProfilerIconTrace   = { bg = c.bg_dark, fg = c.comment },
    SnacksProfilerBadgeTrace  = { bg = c.bg_dark, fg = c.comment },
    SnacksIndent              = { fg = c.fg_gutter, nocombine = true },
    SnacksIndentScope         = { fg = c.blue1, nocombine = true },
    SnacksZenIcon             = { fg = c.purple },
    SnacksInputIcon           = { fg = c.blue1 },
    SnacksInputBorder         = { fg = c.yellow },
    SnacksInputTitle          = { fg = c.yellow },
    -- Picker
    SnacksPickerInputBorder   = { fg = c.orange, bg = c.bg_float },
    SnacksPickerInputTitle    = { fg = c.orange, bg = c.bg_float },
    SnacksPickerBoxTitle      = { fg = c.orange, bg = c.bg_float },
    SnacksPickerSelected      = { fg = c.magenta2},
    SnacksPickerToggle        = "SnacksProfilerBadgeInfo",
    SnacksPickerPickWinCurrent= { fg = c.fg, bg = c.magenta2, bold = true },
    SnacksPickerPickWin       = { fg = c.fg, bg = c.bg_search, bold = true },
  }
  for i, color in ipairs(c.rainbow) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end
  return ret
end

return M
