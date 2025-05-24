G = {}

G.Core = {
  Leader = " ",      -- Leader key
  LocalLeader = " ", -- Local leader key
  AutoSave = true,   -- Auto save files
  Indent = 2,        -- Indent width
}

G.UI = {
  Theme = {
    Active = "gruvbox",
    Mode = "dark",
    Transparent = false,
    Dim = false,
    Underline = true,
    Bold = false,
  },
  FileExplorer = { Width = 40 },
  TabWidth = 4,
  CmdHeight = 0,
  TabLine = false,
  SignColumn = true,
  RelativeNumbers = true, -- Use relative line numbers
  IndentLine = true,
  ColorColumn = true,
}

G.Plugins = {
  lsp         = true,
  notify      = true,
  project     = true,
  yazi        = false,
  neotree     = false,
  snacks      = true,
  minifile    = true,
  neovide     = false,
  toggle_term = true,
  noice       = true,
  treesitter  = true,
  splitjoin   = true,
  session     = true,
  dashboard   = true,
  dap         = true,
  whichkey    = true,
  gitsign     = true,
  Theme       = {
    gruvbox = true
  },
}

G.PluginConfig = {
  treesitter = {
    parsers = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "cpp" },
  },
}

G.Helper = {
  IsWin           = function()
    return vim.fn.has("win32") == 1
  end,
  IsMac           = function()
    return vim.fn.has("mac") == 1
  end,
  IsUnix          = function()
    return vim.fn.has("unix") == 1
  end,
  Dependencies    = {
    HasGoCli = function()
      return vim.fn.executable("go") == 1
    end,
    HasFileExplorerPlugin = function()
      return G.Plugins.minifile or G.Plugins.neotree or G.Plugins.yazi
    end,
    HasYaziExec = function()
      return vim.fn.executable("yazi") == 1
    end,
    HasRipgrepExec = function()
      return vim.fn.executable("rg") == 1
    end,
    HasLazyGit = function()
      return vim.fn.executable("lazygit") == 1
    end,
    HasCCPPCompiler = function()
      return vim.fn.executable("cc") == 1
          or vim.fn.executable("gcc") == 1
          or vim.fn.executable("clang") == 1
          or vim.fn.executable("cl") == 1
          or vim.fn.executable("zig") == 1
    end
  },
  Refresh         = function()
    dofile(vim.env.MYVIMRC)
  end,
  TmuxIsRunning   = function()
    local result = os.getenv("TMUX")
    return not (result == nil or result == "")
  end,
  ZellijIsRunning = function()
    local result = os.getenv("ZELLIJ")
    return not (nil == result or "" == result)
  end,
  CreateTerm      = function(cmd, direction)
    local _cmd = cmd or "";
    local _direction = direction or "float";

    local tt_ok, toggleterm = pcall(require, 'toggleterm')
    if tt_ok then
      local Terminal = toggleterm.Terminal
      local term = Terminal:new({ cmd = _cmd, direction = _direction })
      return term:toggle()
    else
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_open_term(buf, {})
      vim.api.nvim_set_current_buf(buf)
      vim.api.nvim_chan_send(buf, _cmd)
    end

    return nil;
  end,
  Toggleterm      = {
    make = function()
      return G.Helper.CreateTerm("make", "float")
    end,
    lazygit = function()
      return G.Helper.CreateTerm("lazygit", "float")
    end,
    btop = function()
      return G.Helper.CreateTerm("btop", "float")
    end,
  },
  toggle_ui       = function() require('dapui').toggle() end,
  close_ui        = function() require('dapui').close() end,
}

-- Suppress deprecate messages
vim.deprecate = function() end
