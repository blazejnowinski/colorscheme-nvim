local M = {}

M.bg = "Black" -- Ustawiamy statyczną wartość
M.fg = "White" -- Ustawiamy statyczną wartość
M.day_brightness = 0.3

local uv = vim.uv or vim.loop

-- Ta funkcja jest teraz bezużyteczna, ale zostawiamy ją pustą
-- na wypadek, gdyby coś ją wołało.
---@param c  string
local function rgb(c)
  return { 0, 0, 0 } -- Zwracamy cokolwiek, byle nie nil
end

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  -- Zmieniamy na bezpieczniejsze `pcall(require, ...)`
  local ok, ret = pcall(require, modname)
  if not ok then
    return {}
  end
  package.loaded[modname] = ret
  return ret
end

-- ====================================================================
-- Tutaj zaczynają się najważniejsze zmiany
-- Całkowicie "wyłączamy" funkcje matematyczne
-- ====================================================================

--- Zamiast mieszać kolory, po prostu zwracamy kolor pierwszego planu.
function M.blend(foreground, alpha, background)
  return foreground
end

--- Zamiast mieszać z tłem, po prostu zwracamy oryginalny kolor.
function M.blend_bg(hex, amount, bg)
  return hex
end
M.darken = M.blend_bg

--- Zamiast mieszać z kolorem tekstu, po prostu zwracamy oryginalny kolor.
function M.blend_fg(hex, amount, fg)
  return hex
end
M.lighten = M.blend_fg

--- Zamiast odwracać kolory, po prostu zwracamy je bez zmian.
---@param color string|Palette
function M.invert(color)
  return color
end

--- Zamiast rozjaśniać, po prostu zwracamy oryginalny kolor.
function M.brighten(color, lightness_amount, saturation_amount)
  -- Sprawdzamy, czy `color` jest numerem
  if type(color) ~= "number" then
    return color -- Jeśli nie, zwróć bez zmian
  end

  -- Jeśli kolor jest w zakresie 0-7, dodaj 8, aby uzyskać jego jasną wersję
  if color >= 0 and color <= 7 then
    return color + 8
  end
  -- Jeśli kolor jest już jasny (8-15), zwróć go bez zmian
  return color
end

-- ====================================================================
-- Koniec kluczowych zmian. Reszta pliku pozostaje w większości bez zmian.
-- ====================================================================

---@param groups tokyonight.Highlights
---@return table<string, vim.api.keyset.highlight>
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

-- Simple string interpolation.
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
  return (
    str:gsub("($%b{})", function(w)
      return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
    end)
  )
end

---@param file string
function M.read(file)
  local fd = assert(io.open(file, "r"))
  ---@type string
  local data = fd:read("*a")
  fd:close()
  return data
end

---@param file string
---@param contents string
function M.write(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

M.cache = {}

function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/tokyonight-" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
  ---@type boolean, tokyonight.Cache
  local ok, ret = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key string
---@param data tokyonight.Cache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
  for _, style in ipairs({ "storm", "day", "night", "moon" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

return M
