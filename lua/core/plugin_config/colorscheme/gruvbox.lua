local colorscheme = "gruvbox-material"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local M = {}

-- local theme = {
--     bg_dim  = { ["dark"] = "#141617", ["light"] = "#eee0b7" },
--     bg_0    = { ["dark"] = "#1d2021", ["light"] = "#f5edca" },
--     bg_1    = { ["dark"] = "#282A2B", ["light"] = "#eddeb5" },
--     bg_2    = { ["dark"] = "#323435", ["light"] = "#e6d5ae" },
--     bg_3    = { ["dark"] = "#323435", ["light"] = "#dac9a5" },
--     bg_4    = { ["dark"] = "#323435", ["light"] = "#d5c4a1" },
--     bg_5    = { ["dark"] = "#444240", ["light"] = "#d5c4a1" },
--     grey_0  = { ["dark"] = "#7c6f64", ["light"] = "#a89984" },
--     grey_1  = { ["dark"] = "#928374", ["light"] = "#928374" },
--     grey_2  = { ["dark"] = "#a89984", ["light"] = "#7c6f64" },
--     fg_0    = { ["dark"] = "#ebdbb2", ["light"] = "#654735" },
--     fg_1    = { ["dark"] = "#e2cca9", ["light"] = "#654735" },
--     red     = { ["dark"] = "#f2594b", ["light"] = "#c14a4a" },
--     orange  = { ["dark"] = "#f28534", ["light"] = "#c35e0a" },
--     yellow  = { ["dark"] = "#e9b143", ["light"] = "#b47109" },
--     green   = { ["dark"] = "#b0b846", ["light"] = "#6c782e" },
--     aqua    = { ["dark"] = "#8ec07c", ["light"] = "#4c7a5d" },
--     blue    = { ["dark"] = "#80aa9e", ["light"] = "#45707a" },
--     purple  = { ["dark"] = "#d3869b", ["light"] = "#945e80" },
--     accent  = { ["dark"] = "#b0b846", ["light"] = "#6c782e" },
-- }

local theme = {
  bg_dim  = { ["dark"] = "#1b1b1b", ["light"] = "#eee0b7" },
  bg_0    = { ["dark"] = "#282828", ["light"] = "#f5edca" },
  bg_1    = { ["dark"] = "#32302f", ["light"] = "#eddeb5" },
  bg_2    = { ["dark"] = "#3a3735", ["light"] = "#e6d5ae" },
  bg_3    = { ["dark"] = "#3c3836", ["light"] = "#dac9a5" },
  bg_4    = { ["dark"] = "#45403d", ["light"] = "#d5c4a1" },
  bg_5    = { ["dark"] = "#484848", ["light"] = "#d5c4a1" },
  grey_0  = { ["dark"] = "#7c6f64", ["light"] = "#a89984" },
  grey_1  = { ["dark"] = "#928374", ["light"] = "#928374" },
  grey_2  = { ["dark"] = "#a89984", ["light"] = "#7c6f64" },
  fg_0    = { ["dark"] = "#d5c4a1", ["light"] = "#654735" },
  fg_1    = { ["dark"] = "#ebdbb2", ["light"] = "#654735" },
  red     = { ["dark"] = "#f2594b", ["light"] = "#c14a4a" },
  orange  = { ["dark"] = "#e78a4e", ["light"] = "#c35e0a" },
  yellow  = { ["dark"] = "#E5AF48", ["light"] = "#b47109" },
  green   = { ["dark"] = "#B0B84C", ["light"] = "#6c782e" },
  aqua    = { ["dark"] = "#8ec07c", ["light"] = "#4c7a5d" },
  blue    = { ["dark"] = "#8AA98A", ["light"] = "#45707a" },
  purple  = { ["dark"] = "#d3869b", ["light"] = "#945e80" },
  accent  = { ["dark"] = "#b0b846", ["light"] = "#6c782e" },
}

M.getcolors = function(mode)
  mode = mode or Arunvi.option.background.mode
  local colors = {}
  for i, v in pairs(theme) do
    colors[i] = v[mode]
  end
  return colors
end

M.setup = function()
  vim.g.gruvbox_material_background = 'medium';
  vim.g.gruvbox_material_foreground = 'mix';
  vim.g.gruvbox_material_enable_bold = 1;
  vim.g.gruvbox_material_enable_italic = 1;
  vim.cmd("set background="..Arunvi.option.background.mode);
  vim.g.gruvbox_material_dim_inactive_windows = Arunvi.option.background.dim and 1 or 0;
  vim.g.gruvbox_material_transparent_background = Arunvi.option.background.transparent and 2 or 0;
  -- vim.g.gruvbox_material_visual = 'string_here'; -- see h: gruvbox-material
  vim.g.gruvbox_material_ui_contrast = "hard";
  vim.g.gruvbox_material_disable_terminal_colors = 1; -- maintain your terminal color inside nvim

  vim.cmd("colorscheme gruvbox-material")
  local colors = M.getcolors(Arunvi.option.background.mode)
  local hl = vim.api.nvim_set_hl
  hl(0, "TSPunctBracket",    { bg = nil, fg = colors.bg_5 })
  hl(0, "Function",          { bg = nil, fg = colors.green })
  hl(0, "TSOperator",        { bg = nil, fg = colors.orange })
  hl(0, "TSTypeQualifier",   { bg = nil, fg = colors.red })
  hl(0, "TSTypeBuiltin",     { bg = nil, fg = colors.yellow })
  hl(0, "TSType",            { bg = nil, fg = colors.yellow })
  hl(0, "TSTag",             { bg = nil, fg = colors.aqua })
  hl(0, "TSTagDelimiter",    { bg = nil, fg = colors.grey_0 })
  hl(0, "TSTagAttribute",    { bg = nil, fg = colors.yellow })
  hl(0, "TSKeyword",         { bg = nil, fg = colors.red })
  hl(0, "TSProperty",        { bg = nil, fg = colors.blue })
  hl(0, "TSField",           { bg = nil, fg = colors.blue })
end

return M
