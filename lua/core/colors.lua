local M = {}

local PalleteKey = {
  "bgdim", "bg0", "bg1", "bg2", "bg3", "bg4", "bg5",
  "grey0", "grey1", "grey2",
  "fg0", "fg1",
  "red", "orange", "yellow", "green", "aqua", "blue", "purple", "accent"
}

local DefaultPallete = {
  dark = {
    bgdim  = "#181818",
    bg0    = "#1b1b1b",
    bg1    = "#282828",
    bg2    = "#3a3735",
    bg3    = "#3c3836",
    bg4    = "#45403d",
    bg5    = "#484848",
    grey0  = "#7c6f64",
    grey1  = "#928374",
    grey2  = "#a89984",
    fg0    = "#d5c4a1",
    fg1    = "#ebdbb2",
    red    = "#f2594b",
    orange = "#e78a4e",
    yellow = "#E5AF48",
    green  = "#B0B84C",
    aqua   = "#8ec07c",
    blue   = "#8AA98A",
    purple = "#d3869b",
    accent = "#b0b846",
  },
  light = {
    bgdim  = "#eee0b7",
    bg0    = "#f5edca",
    bg1    = "#eddeb5",
    bg2    = "#e6d5ae",
    bg3    = "#dac9a5",
    bg4    = "#d5c4a1",
    bg5    = "#d5c4a1",
    grey0  = "#a89984",
    grey1  = "#928374",
    grey2  = "#7c6f64",
    fg0    = "#654735",
    fg1    = "#654735",
    red    = "#c14a4a",
    orange = "#c35e0a",
    yellow = "#b47109",
    green  = "#6c782e",
    aqua   = "#4c7a5d",
    blue   = "#45707a",
    purple = "#945e80",
    accent = "#6c782e",
  }
}

M.Pallete = DefaultPallete

M.GetPallete = function(mode)
  return M.Pallete[string.lower(mode)]
end

M.SetPalette = function(pallete)
  if M.ColorsValid(pallete) then
    M.Pallete = pallete
  end
end

M.PalleteValid = function(pallete)
  if pallete.dark == nil or pallete.light == nil then
    return false
  end
  for i = 1, #PalleteKey do
    local key = PalleteKey[i]
    if pallete.dark[key] == nil or pallete.light[key] then
      return false
    end
  end
  return true
end

return M;
