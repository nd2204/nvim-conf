local M = {}

local PalleteKey = {
  "bg_dim", "bg0", "bg1", "bg2", "bg3", "bg4", "bg5",
  "bg_statusline1", "bg_statusline2", "bg_statusline3",
  "bg_diff_green", "bg_visual_green", "bg_diff_red", "bg_visual_red",
  "bg_diff_blue", "bg_visual_blue", "bg_visual_yellow", "bg_current_word",
  "fg0", "fg1",
  "red", "orange", "yellow", "green", "aqua", "blue", "purple",
  "bg_red", "bg_yellow", "bg_green",
  "grey0", "grey1", "grey2"
}

local DefaultPallete = {
  dark = {
    bg_dim = "#151515",
    bg0 = "#181818",
    bg1 = "#232323",
    bg2 = "#282828",
    bg3 = "#32302f",
    bg4 = "#3c3836",
    bg5 = "#504945",
    bg_statusline1 = "#282828",
    bg_statusline2 = "#32302f",
    bg_statusline3 = "#504945",
    bg_diff_green = "#32361e",
    bg_visual_green = "#333e34",
    bg_diff_red = "#3c1f1e",
    bg_visual_red = "#442e2d",
    bg_diff_blue = "#0d3138",
    bg_visual_blue = "#2e3b3b",
    bg_visual_yellow = "#473c29",
    bg_current_word = "#32302f",
    fg0 = "#ebdbb2",
    fg1 = "#ddc7a1",
    red = "#fb4934",
    orange = "#fe8019",
    yellow = "#fabd2f",
    green = "#b8bb26",
    aqua = "#8ec07c",
    blue = "#8AA98A",
    purple = "#d3869b",
    bg_red = "#fb4934",
    bg_yellow = "#fabd2f",
    bg_green = "#b8bb26",
    grey0 = "#5F564F",
    grey1 = "#665C55",
    grey2 = "#7c6f64",
  },
  light = {
    bg_dim = "#f9f5d7",
    bg0 = "#fbf1c7",
    bg1 = "#f2e5bc",
    bg2 = "#ebdbb2",
    bg3 = "#d5c4a1",
    bg4 = "#bdae93",
    bg5 = "#a89984",
    bg_statusline1 = "#f5edca",
    bg_statusline2 = "#f3eac7",
    bg_statusline3 = "#eee0b7",
    bg_diff_green = "#e4edc8",
    bg_visual_green = "#dde5c2",
    bg_diff_red = "#f8e4c9",
    bg_visual_red = "#f0ddc3",
    bg_diff_blue = "#e0e9d3",
    bg_visual_blue = "#d9e1cc",
    bg_visual_yellow = "#f9eabf",
    bg_current_word = "#f3eac7",
    fg0 = "#3c3836",
    fg1 = "#3c3836",
    red = "#9d0006",
    orange = "#af3a03",
    yellow = "#b57614",
    green = "#79740e",
    aqua = "#427b58",
    blue = "#076678",
    purple = "#8f3f71",
    bg_red = "#ae5858",
    bg_yellow = "#6f8352",
    bg_green = "#a96b2c",
    grey0 = "#5F564F",
    grey1 = "#665C55",
    grey2 = "#7c6f64",
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
    vim.notify("Palette does not contains light or dark variant")
    return false
  end
  for i = 1, #PalleteKey do
    local key = PalleteKey[i]
    if pallete.dark[key] == nil or pallete.light[key] then
      vim.notify("Palette does not contain key: " .. key .. " or value is nil")
      return false
    end
  end
  return true
end

return M;
