return G.Plugins.Theme.gruvbox and {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local pallete = require("core.colors").Pallete
    require("gruvbox").setup({
      palette_overrides = {
        dark0_hard = pallete.dark.bgdim,
        dark0 = pallete.dark.bg0,
        dark0_soft = pallete.dark.bg1,
        dark1 = pallete.dark.bg2,
        dark2 = pallete.dark.bg3,
        dark3 = pallete.dark.bg4,
        dark4 = pallete.dark.bg5,
        light0_hard = pallete.light.bgdim,
        light0 = pallete.light.bg0,
        light0_soft = pallete.light.bg1,
        light1 = pallete.light.bg2,
        light2 = pallete.light.bg3,
        light3 = pallete.light.bg4,
        light4 = pallete.light.bg5,
        bright_red = pallete.dark.red,
        bright_green = pallete.dark.green,
        bright_yellow = pallete.dark.yellow,
        bright_blue = pallete.dark.blue,
        bright_purple = pallete.dark.purple,
        bright_aqua = pallete.dark.aqua,
        bright_orange = pallete.dark.orange,
        faded_red = pallete.light.red,
        faded_green = pallete.light.green,
        faded_yellow = pallete.light.yellow,
        faded_blue = pallete.light.blue,
        faded_purple = pallete.light.purple,
        faded_aqua = pallete.light.aqua,
        faded_orange = pallete.light.orange,
        gray = pallete.dark.grey2,
      },
      overrides = {}
    })
    vim.cmd("colorscheme gruvbox")
  end,
  opts = ...
} or {}
