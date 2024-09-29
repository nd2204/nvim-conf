-- Bootstrapping lazy (Plugins manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function is_enabled(plugin)
  return Arunvi.plugins[plugin].enable
end

-- Table of plugins
local plugins = {
  -- Productivity
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  'windwp/nvim-autopairs',
  'nvim-tree/nvim-tree.lua',
  'lewis6991/impatient.nvim',
  'akinsho/toggleterm.nvim',
  'Wansmer/treesj',
  -- UIs
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  "folke/which-key.nvim",
  -- Colorscheme
  {"catppuccin/nvim", name = "catppuccin" },
  {'rose-pine/neovim', name = 'rose-pine'},
  {"ellisonleao/gruvbox.nvim"},
  {"sainnhe/gruvbox-material"},
  {"sainnhe/everforest"},
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
  },
  -- Syntax
  'nvim-treesitter/nvim-treesitter',
  'windwp/nvim-ts-autotag',
  {'RRethy/nvim-treesitter-endwise', enabled = is_enabled('treesitter')},
  {'RRethy/nvim-treesitter-textsubjects', enabled = is_enabled('treesitter')},
  {'p00f/nvim-ts-rainbow'},
  {"lukas-reineke/indent-blankline.nvim"},
  {'norcalli/nvim-colorizer.lua'},
  {'hrsh7th/nvim-cmp', enabled = is_enabled('lsp')},
  {'hrsh7th/cmp-nvim-lsp', enabled = is_enabled('lsp')},
  {'hrsh7th/cmp-buffer', enabled = is_enabled('lsp')},
  {'hrsh7th/cmp-path', enabled = is_enabled('lsp')},
  {'hrsh7th/cmp-cmdline', enabled = is_enabled('lsp')},
  {'saadparwaiz1/cmp_luasnip', enabled = is_enabled('lsp')},
  {"L3MON4D3/LuaSnip", enabled = is_enabled('lsp')},  -- snippet engine
  {"rafamadriz/friendly-snippets", enabled = is_enabled('lsp')}, -- a bunch of snippets to use
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {"folke/neodev.nvim", opts = {} },
  {"williamboman/mason.nvim", enabled = is_enabled('lsp')},
  {"williamboman/mason-lspconfig.nvim", enabled = is_enabled('lsp')},
  {"neovim/nvim-lspconfig", enabled = is_enabled('lsp')},
  {"onsails/lspkind.nvim", enabled = is_enabled('lsp')}, -- Vscode like picktogram for completion
  -- {"glepnir/lspsaga.nvim", event = "BufRead"}, -- LSP UIs
  {"jose-elias-alvarez/null-ls.nvim", enabled = is_enabled('lsp')},
  {
    'jay-babu/mason-null-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    enabled = is_enabled('lsp'),
  },
  -- Debugger
  {'mfussenegger/nvim-dap', enabled = is_enabled('dap')}, -- debugging plugins
  {'theHamsta/nvim-dap-virtual-text', enabled = is_enabled('dap')}, -- inline variable definition
  -- {'nvim-telescope/telescope-dap.nvim', enabled = is_enabled('dap')},
  {'rcarriga/nvim-dap-ui', enabled = is_enabled('dap')}, -- debugger UIs
  {'jay-babu/mason-nvim-dap.nvim', event = "VeryLazy", enabled = is_enabled('dap')},

  -- Markdown
  -- 'godlygeek/tabular',
  'preservim/vimux',
}

local ide = {
  java = function()
    table.insert(plugins, {
      { 'mfussenegger/nvim-jdtls' }
    })
  end,
  ccpp = function()
    table.insert(plugins, {
      { 'nd2204/quickimpl.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter' } }
    })
  end
}

for _, v in pairs(Arunvi.plugins.env) do
  if ide[v] ~= nil then
    ide[v]()
  end
end

local opts = {}

require("lazy").setup(plugins, opts)
