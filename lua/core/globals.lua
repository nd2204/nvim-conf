G = {}

G.Core = {
  Leader = " ",      -- Leader key
  LocalLeader = " ", -- Local leader key
  AutoSave = true,   -- Auto save files
}

G.UI = {
  Theme = {
    Active = "gruvbox",
    Mode = "dark",
    Transparent = true,
    Dim = false
  },
  FileExplorer = { Width = 40 },
  TabWidth = 2,
  CmdHeight = 1,
  SignColumn = true,
  RelativeNumbers = true, -- Use relative line numbers
}

G.Plugins = {
  lsp        = true,
  notify     = true,
  project    = true,
  treesitter = true,
  dap        = true,
  whichkey   = true,
  Theme      = {
    gruvbox = true
  }
}

G.PluginConfig = {

}

G.Helper = {
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
