return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function get_current_dir()
      local cwd = vim.fn.getcwd()
      local last_separator = string.find(string.reverse(cwd), "[\\|/]") * -1
      return [[ ]] .. string.sub(cwd, last_separator + 1)
    end

    local colors          = require("core.colors").GetPallete(G.UI.Theme.Mode);
    -- local middlebg        = G.UI.Theme.Transparent and "none" or colors.bg3
    -- local middlefg        = G.UI.Theme.Transparent and colors.bg3 or colors.grey2
    -- local innerbg         = G.UI.Theme.Transparent and "none" or colors.bg1
    -- local innerfg         = G.UI.Theme.Transparent and colors.fg0 or colors.grey1
    -- local mode_normal_bg  = G.UI.Theme.Transparent and "none" or colors.grey2
    -- local mode_normal_fg  = G.UI.Theme.Transparent and colors.grey1 or colors.bg_dim
    -- local mode_insert_bg  = G.UI.Theme.Transparent and "none" or colors.blue
    -- local mode_insert_fg  = G.UI.Theme.Transparent and colors.blue or colors.bg0
    -- local mode_visual_bg  = G.UI.Theme.Transparent and "none" or colors.yellow
    -- local mode_visual_fg  = G.UI.Theme.Transparent and colors.yellow or colors.bg0
    -- local mode_command_bg = G.UI.Theme.Transparent and "none" or colors.aqua
    -- local mode_command_fg = G.UI.Theme.Transparent and colors.aqua or colors.bg0
    -- local mode_replace_bg = G.UI.Theme.Transparent and "none" or colors.red
    -- local mode_replace_fg = G.UI.Theme.Transparent and colors.red or colors.bg0
    local mode_normal_bg  = "none"
    local mode_normal_fg  = colors.fg1
    local mode_insert_bg  = "none"
    local mode_insert_fg  = colors.blue
    local mode_visual_bg  = "none"
    local mode_visual_fg  = colors.yellow
    local mode_command_bg = "none"
    local mode_command_fg = colors.aqua
    local mode_replace_bg = "none"
    local mode_replace_fg = colors.red
    local middlebg        = "none"
    local middlefg        = colors.grey2
    local innerbg         = "none"
    local innerfg         = colors.grey0

    local opt_theme       = {
      normal = {
        a = { bg = mode_normal_bg, fg = mode_normal_fg, gui = 'bold' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      },
      insert = {
        a = { bg = mode_insert_bg, fg = mode_insert_fg, gui = 'bold' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      },
      visual = {
        a = { bg = mode_visual_bg, fg = mode_visual_fg, gui = 'bold' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      },
      replace = {
        a = { bg = mode_replace_bg, fg = mode_replace_fg, gui = 'bold' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      },
      command = {
        a = { bg = mode_command_bg, fg = mode_command_fg, gui = 'bold' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      },
      inactive = {
        a = { bg = innerbg, fg = middlebg, gui = 'none' },
        b = { bg = middlebg, fg = middlefg },
        c = { bg = innerbg, fg = innerfg }
      }
    }

    local buffers         = {
      'buffers',
      use_mode_colors = false,
      buffers_color = {
        active = { bg = G.UI.Theme.Transparent and "none" or colors.bg_dim, fg = colors.green },
        inactive = { bg = innerbg, fg = innerfg },
      },
      symbols = { alternate_file = '' },
    }

    local filename        = {
      'filename',
      file_status = true,     -- Displays file status (readonly status, modified status)
      newfile_status = false, -- Display new file status (new file means no write after created)
      path = 0,               -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory
      -- 4: Filename and parent dir, with tilde as the home directory

      shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
      }
    }

    local buffers_count   = function()
      return " " .. #vim.fn.getbufinfo({ buflisted = 1 })
    end

    local lsp             = {
      'lsp_status',
      icon = '', -- f013
      symbols = {
        -- Standard unicode symbols to cycle through for LSP progress:
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
        -- Standard unicode symbol for when LSP is done:
        done = '✓',
        -- Delimiter inserted between LSP names:
        separator = ' ',
      },
      -- List of LSP names to ignore (e.g., `null-ls`):
      ignore_lsp = {},
    }

    require('lualine').setup {
      options = {
        theme = opt_theme,
        icons_enabled = true,
        -- section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '/', right = '\\'},
        -- component_separators = { left = '▕', right = '▏'},
        component_separators = { left = '|', right = '|' },
        disabled_filetypes = {
          statusline = { 'NvimTree', 'nofile', 'dashboard', "snacks_dashboard", 'neo-tree' },
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
          get_current_dir,
        },
        lualine_b = {
          { 'branch', icon = '' },
          { 'diff' },
        },
        lualine_c = {
          buffers_count,
          filename,
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_x = {
          {
            'searchcount',
            maxcount = 999,
            timeout = 500,
          },
          { 'encoding' },
          { 'fileformat' },
        },
        lualine_y = {
          lsp
        },
        lualine_z = {
          { 'progress' }
        }
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
