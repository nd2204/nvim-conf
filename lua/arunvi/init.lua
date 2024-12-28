Arunvi = {}

local tt_ok, toggleterm = pcall(require, 'toggleterm')

Arunvi.option = {
  tabwidth = 2,
  background = {
    colorscheme = "gruvbox", -- Available: gruvbox | rose-pine | catppuccin | everforest | nordic
    mode = "dark", -- Available: "dark" | "light" -- NOT RECOMMENDED
    transparent = true,
    dim = false,
  },
  cmdheight = 1,
}

Arunvi.plugins = {
  env = {
    'java', 'ccpp'
  },
  lsp = {enable = true},
  notify = {enable = false},
  dap = {
    enable = true,
    virtualtext = {enable = true},
    toggle_ui = function() require('dapui').toggle() end,
    close_ui = function() require('dapui').close() end,
  },
  treesitter = {
    enable = true, rainbow = {enable = false},
  },
  project = {enable = true},
  NvimTreeWidth = 40,
  toggleterm = {
    make = function()
      if tt_ok then
        local Terminal = toggleterm.Terminal
        local _make = Terminal:new({cmd="make", direction = "float"})
        return _make:toggle()
      end
    end,
    lazygit = function()
      local Terminal = toggleterm.Terminal
      local _lazygit = Terminal:new({cmd="lazygit", direction = "float"})
      return _lazygit:toggle()
    end,
    btop = function()
      local Terminal = toggleterm.Terminal
      local _btop = Terminal:new({cmd="btop", direction = "float"})
      return _btop:toggle()
    end,
    bs = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local _bs = Terminal:new({cmd="browser-sync start -s -f -w", direction = "horizontal"})
      return _bs:toggle()
    end,
  },
}

Arunvi.helper = {
  refresh = function()
    dofile(vim.env.MYVIMRC)
  end,
  tmuxIsRunning = function()
    local result = os.getenv("TMUX")
    return not (result == nil or result == "")
  end,
  zellijIsRunning = function()
    local result = os.getenv("ZELLIJ")
    return not (nil == result or "" == result)
  end
}

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.lua",
--   callback = function()
--     local file = vim.fn.expand("<afile>")
--     vim.notify(file)
--     if file:match(vim.env.MYVIMRC) or file:match(vim.fn.stdpath("config")[1]) then
--       for name, _ in pairs(package.loaded) do
--         if name:match("^") then
--           package.loaded[name] = nil

--         end
--       end
--       dofile(vim.env.MYVIMRC)
--       print("Configuration reloaded!")
--     end
--   end,
-- })

require("arunvi.options")
require("arunvi.plugins")
require("arunvi.keymaps")
