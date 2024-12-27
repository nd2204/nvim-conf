local function get_current_dir()
  local cwd = vim.fn.getcwd()
  local last_separator = string.find(string.reverse(cwd), "[\\|/]") * -1
  return [[ ]]..string.sub(cwd, last_separator + 1)
end

---@type (string|table)
local opt_theme = "auto"

local theme = Arunvi.option.background.colorscheme
local ok, colorscheme = pcall(require, "core.plugin_config.colorscheme."..theme)
if ok then
  local colors = colorscheme.getcolors()
  if Arunvi.option.background.transparent then
    colors.innerbg = nil
    colors.outerbg = nil

    colors.mode_normal_bg = nil
    colors.mode_normal_fg = colors.grey_1

    colors.mode_insert_bg = nil
    colors.mode_insert_fg = colors.blue

    colors.mode_visual_bg = nil
    colors.mode_visual_fg = colors.yellow

    colors.mode_command_bg = nil
    colors.mode_command_fg = colors.aqua

    colors.mode_replace_bg = nil
    colors.mode_replace_fg = colors.red

    colors.innerfg = colors.grey_1
    colors.outerfg = colors.fg_0
  else
    colors.innerbg = colors.bg_4
    colors.outerbg = colors.bg_1

    colors.mode_normal_bg = colors.grey_1
    colors.mode_normal_fg = colors.bg_0

    colors.mode_insert_bg = colors.blue
    colors.mode_insert_fg = colors.bg_0

    colors.mode_visual_bg = colors.yellow
    colors.mode_visual_fg = colors.bg_0

    colors.mode_command_bg = colors.aqua
    colors.mode_command_fg = colors.bg_0

    colors.mode_replace_bg = colors.red
    colors.mode_replace_fg = colors.bg_0

    colors.innerfg = colors.grey_0
    colors.outerfg = colors.grey_1
  end
  opt_theme = {
    normal = {
      a = {bg = colors.mode_normal_bg, fg = colors.mode_normal_fg, gui = 'bold'},
      b = {bg = colors.innerbg, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    },
    insert = {
      a = {bg = colors.mode_insert_bg, fg = colors.mode_insert_fg, gui = 'bold'},
      b = {bg = colors.innerbg, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    },
    visual = {
      a = {bg = colors.mode_visual_bg, fg = colors.mode_visual_fg, gui = 'bold'},
      b = {bg = colors.innerbg, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    },
    replace = {
      a = {bg = colors.mode_replace_bg, fg = colors.mode_replace_fg, gui = 'bold'},
      b = {bg = colors.bg_5, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    },
    command = {
      a = {bg = colors.mode_command_bg, fg = colors.mode_command_fg, gui = 'bold'},
      b = {bg = colors.innerbg, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    },
    inactive = {
      a = {bg = colors.outerbg, fg = colors.innerbg, gui = 'none'},
      b = {bg = colors.innerbg, fg = colors.outerfg},
      c = {bg = colors.outerbg, fg = colors.innerfg}
    }
  }
end

require('lualine').setup {
  options = {
    theme = opt_theme,
    icons_enabled = true,
    -- section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},
    -- component_separators = { left = '/', right = '\\'},
    -- component_separators = { left = '▕', right = '▏'},
    component_separators = { left = '|', right = '|'},
    disabled_filetypes = {
      -- statusline = {'NvimTree'},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },

  sections = {
    lualine_a = {
      get_current_dir
    },
    lualine_b = {
      {
        'buffers',
        use_mode_colors = false,
        buffers_color = {
          active = 'lualine_b_normal',
          inactive = 'lualine_c_inactive',
        },
        symbols = { alternate_file = '' },
      },
    },
    lualine_c = {
      { 'branch', icon = '' },
      { 'diff' },
    },
    lualine_x = {
      {
        'diagnostics',
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
      },
      { '' },
      { 'encoding' },
      { 'fileformat' }
    },
    lualine_y = {
      { 'progress' }
    },
    lualine_z = {}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
