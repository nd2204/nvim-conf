local colorscheme = "gruvbox-material"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local nordic_ok, nordic = pcall(require, "nordic")
if not nordic_ok then
  vim.notify("Nordic theme not found")
  return
end

local M = {}

local theme = {
  bg_dark = { ["dark"] = "#191D24", ["light"] = "#ECEFF4" },
  bg_dim  = { ["dark"] = "#1E222A", ["light"] = "#E5E9F0" },
  bg_0    = { ["dark"] = "#242933", ["light"] = "#BBC3D4" },
  bg_1    = { ["dark"] = "#2E3440", ["light"] = "#D8DEE9" },
  bg_2    = { ["dark"] = "#3B4252", ["light"] = "#242933" },
  bg_3    = { ["dark"] = "#434C5E", ["light"] = "#2E3440" },
  bg_4    = { ["dark"] = "#434C5E", ["light"] = "#3B4252" },
  bg_5    = { ["dark"] = "#434C5E", ["light"] = "#434C5E" },
  grey_0  = { ["dark"] = "#4C566A", ["light"] = "#4C566A" },
  grey_1  = { ["dark"] = "#60728A", ["light"] = "#4C566A" },
  grey_2  = { ["dark"] = "#60728A", ["light"] = "#60728A" },
  fg_0    = { ["dark"] = "#C0C8D8", ["light"] = "#ECEFF4" },
  fg_1    = { ["dark"] = "#D8DEE9", ["light"] = "#E5E9F0" },
  red     = { ["dark"] = "#D3869B", ["light"] = "#BF616A" },
  orange  = { ["dark"] = "#D08770", ["light"] = "#D08770" },
  yellow  = { ["dark"] = "#EBCB8B", ["light"] = "#EBCB8B" },
  green   = { ["dark"] = "#A3BE8C", ["light"] = "#A3BE8C" },
  aqua    = { ["dark"] = "#8FBCBB", ["light"] = "#8FBCBB" },
  blue    = { ["dark"] = "#5E81AC", ["light"] = "#5E81AC" },
  purple  = { ["dark"] = "#B48EAD", ["light"] = "#B48EAD" },
  accent  = { ["dark"] = "#A3BE8C", ["light"] = "#A3BE8C" },
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
  vim.cmd("colorscheme " .. colorscheme)
  nordic.setup {
    on_palette = function(palette) return palette end,
    bold_keywords = false,
    italic_comments = true,
    transparent_bg = Arunvi.option.background.transparent,
    bright_border = false,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    override = {},
    cursorline = {
      bold = false,
      bold_number = true,
      theme = 'dark',
      blend = 0.85,
    },
    telescope = {
      -- Available styles: `classic`, `flat`.
      style = 'flat',
    },
    leap = {
      -- Dims the backdrop when using leap.
      dim_backdrop = false,
    },
    ts_context = {
      -- Enables dark background for treesitter-context window
      dark_background = true,
    }
  }
  local colors = M.getcolors(Arunvi.option.background.mode)
  local hl = vim.api.nvim_set_hl;
  hl(0, "TSPunctBracket",    { bg = nil, fg = colors.bg_5 })
  hl(0, "Function",          { bg = nil, fg = colors.green })
  hl(0, "TSOperator",        { bg = nil, fg = colors.orange })
  hl(0, "TSTypeQualifier",   { bg = nil, fg = colors.orange })
  hl(0, "TSTypeBuiltin",     { bg = nil, fg = colors.yellow })
  hl(0, "TSType",            { bg = nil, fg = colors.yellow })
  hl(0, "TSTag",             { bg = nil, fg = colors.aqua })
  hl(0, "TSTagDelimiter",    { bg = nil, fg = colors.grey_0 })
  hl(0, "TSTagAttribute",    { bg = nil, fg = colors.yellow })
  hl(0, "TSKeyword",         { bg = nil, fg = colors.red })
  hl(0, "TSProperty",        { bg = nil, fg = colors.aqua })
  hl(0, "TSField",           { bg = nil, fg = colors.aqua })
end

return M
