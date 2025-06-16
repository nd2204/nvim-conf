return G.Plugins.Theme.gruvbox and {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local colors = require("core.colors")
    local pallete = colors.Pallete
    local mode = colors.GetPallete(G.UI.Theme.Mode)
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = G.UI.Theme.Underline,
      bold = G.UI.Theme.Bold,
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = false,   -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      dim_inactive = false,
      transparent_mode = G.UI.Theme.Transparent,
      palette_overrides = {
        dark0_hard    = pallete.dark.bg_dim,
        dark0         = pallete.dark.bg0,
        dark0_soft    = pallete.dark.bg1,
        dark1         = pallete.dark.bg2,
        dark2         = pallete.dark.bg3,
        dark3         = pallete.dark.bg4,
        dark4         = pallete.dark.bg5,
        light0_hard   = pallete.light.bg0,
        light0        = pallete.light.bg1,
        light0_soft   = pallete.light.bg2,
        light1        = pallete.light.bg3,
        light2        = pallete.light.bg4,
        light3        = pallete.light.bg5,
        light4        = pallete.light.bg5,
        bright_red    = pallete.dark.red,
        bright_green  = pallete.dark.green,
        bright_yellow = pallete.dark.yellow,
        bright_blue   = pallete.dark.blue,
        bright_purple = pallete.dark.purple,
        bright_aqua   = pallete.dark.aqua,
        bright_orange = pallete.dark.orange,
        faded_red     = pallete.light.red,
        faded_green   = pallete.light.green,
        faded_yellow  = pallete.light.yellow,
        faded_blue    = pallete.light.blue,
        faded_purple  = pallete.light.purple,
        faded_aqua    = pallete.light.aqua,
        faded_orange  = pallete.light.orange,
        gray          = pallete.dark.grey0,
      },
      overrides = {
        -- Syntax
        Include = { link = "GruvboxRed" },
        Define = { link = "GruvboxPurple" },
        PreProc = { link = "GruvboxPurple" },
        PreCondit = { link = "GruvboxPurple" },
        Macro = { link = "GruvboxPurple" },
        Delimiter = { link = "GruvboxGray" },
        LuaTable = { link = "GruvboxGray" },

        -- UI
        GruvboxRedUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.red
        },
        GruvboxGreenUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.green
        },
        GruvboxYellowUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.yellow
        },
        GruvboxBlueUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.blue
        },
        GruvboxPurpleUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.purple
        },
        GruvboxAquaUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.aqua
        },
        GruvboxOrangeUnderline = {
          undercurl = false,
          underline = G.UI.Theme.Underline,
          sp = colors.orange
        },
        GruvboxRedSign = { link = "GruvboxRed" },
        GruvboxAquaSign = { link = "GruvboxAqua" },
        GruvboxYellowSign = { link = "GruvboxYellow" },
        GruvboxGreenSign = { link = "GruvboxRed" },
        GruvboxBlueSign = { link = "GruvboxBlue" },
        GruvboxOrangeSign = { link = "GruvboxOrange" },
        GruvboxPurpleSign = { link = "GruvboxPurple" },
        NormalFloat = { bg = "none" },
        FloatBorder = { fg = mode.bg4, bg = "none" },
        CursorLineNr = { link = "GruvboxFg0" },
        CursorLine = { bg = "none" },
        StatusLineNC = { bg = G.UI.Theme.Transparent and "none" or mode.bg_dim },
        StatusLine = { bg = G.UI.Theme.Transparent and "none" or mode.bg0 },
        ColorColumn = { link = "StatusLine" },
        SignColumn = { bg = "none" },
        TabLineFill = { bg = G.UI.Theme.Transparent and "none" or mode.bg0 },
        TabLineSel = { bg = G.UI.Theme.Transparent and "none" or mode.bg0 },

        -- Telescope
        TelescopeNormal = { link = "GruvboxFg1" },
        TelescopeSelection = { bg = mode.bg1 },
        TelescopeSelectionCaret = { link = "GruvboxRed" },
        TelescopeMultiSelection = { link = "GruvboxBlue" },
        TelescopeBorder = { link = "FloatBorder" },
        TelescopePromptBorder = { link = "TelescopeBorder" },
        TelescopeResultsBorder = { link = "TelescopeBorder" },
        TelescopePreviewBorder = { link = "TelescopeBorder" },
        TelescopeMatching = { link = "GruvboxOrange" },
        TelescopePromptPrefix = { link = "GruvboxRed" },
        TelescopePrompt = { link = "TelescopeNormal" },

        -- Snacks
        SnacksPicker = { link = "GruvboxGray" },
        SnacksIndentScope = { link = "GruvboxGreen" },
        SnacksIndentChunk = { link = "GruvboxGreen" },

        -- Mini
        MiniFilesCursorLine = { link = "TelescopeSelection" },

        -- nvim-cmp
        CmpItemKind = { link = "GruvboxFg1" },
        CmpItemAbbr = { link = "CmpItemKind" },

        -- noice
        NoiceCmdlinePopupBorder = { link = "GruvboxGray" },

      },
    })
    vim.cmd("set background=" .. G.UI.Theme.Mode);
    vim.cmd("colorscheme gruvbox")
  end,
} or {}
