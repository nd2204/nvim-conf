local colorscheme = "rose-pine"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


require('rose-pine').setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = 'auto',
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = 'main',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = Arunvi.option.background.transparent,
  disable_float_background = Arunvi.option.background.transparent,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette

  groups = {
    background = '#0d0f18',
    background_nc = '_experimental_nc',
    panel = 'surface',
    panel_nc = 'nc',
    border = 'highlight_med',
    comment = 'muted',

    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = 'rose' },

    -- NvimTree
    NvimTreeIndentMarker = { fg= 'subtle' },

    -- WinSeparator
    WinSeparator = {bg='base', fg='highlight_med'},

    -- Blend colours against the "base" background
    CursorLine = { bg = 'foam', blend = 10 },
    StatusLine = { fg = 'love', bg = 'love', blend = 10 },
    NvimTreeWindowPicker = {bg = 'highlight_high', fg = 'love', bold = true},

    -- Float
    NormalFloat = {fg = 'text', bg = nil},
    FLoatTitle = {fg = 'text'},
    -- Illuminated plugins
    IlluminatedWordRead = {gui=nil, bg='highlight_med'},
    IlluminatedWordText = {gui=nil, bg='highlight_med'},
    IlluminatedWordWrite = {gui=nil, bg='highlight_med'},
    -- Telescope plugins
    TelescopeTitle = {fg = 'text'},
    TelescopeNormal = {fg = 'text', bg = nil},
    TelescopeBorder = {fg = 'highlight_high', bg = nil},
    TelescopePromptNormal = {fg = 'text', bg = nil},
    -- Dashboard plugins
    DashboardHeader = {fg='foam'},
    Stabline = {bg = 'overlay', fg = 'overlay'}
  }
})

if Arunvi.option.background.mode == "light" then require('rose-pine').setup({ variant = "dawn" }) end

vim.cmd("colorscheme rose-pine")
