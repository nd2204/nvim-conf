vim.cmd('filetype plugin indent on')
local g = vim.g
local opt = vim.opt
local wo = vim.wo

g.mapleader         = ' '
g.maplocalleader    = ' '

opt.ttyfast = true

-- opt.shortmess       = opt.shortmess .. "I"
opt.shortmess       = vim.o.shortmess .. 'aoOstTWI'
opt.hidden          = true
opt.whichwrap       = 'b,<,>,[,],h,l'
opt.pumheight       = 10
opt.fileencoding    = "utf-8"
opt.cmdheight       = Arunvi.option.cmdheight
opt.splitbelow      = true
opt.splitright      = true
opt.showtabline     = 0             -- always show tabs (2 is always)
opt.showmode        = false         -- No more --Insert-- indication
opt.updatetime      = 300
opt.timeoutlen      = 200
opt.ignorecase      = true
opt.mouse           = "a"           -- allow the mouse to be used in neovim
opt.scrolloff       = 10             -- spare n line between your cursor and the bottom of the screen when scroll down
opt.sidescrolloff   = 0
-- opt.clipboard       = "unnamedplus"
vim.cmd("set guicursor=\"n-v-c-sm-i-ci-ve:block,r-cr-e:hor20\"")

wo.wrap             = false          -- wrap line
opt.textwidth       = 80
wo.colorcolumn      = "+1"
wo.cursorline       = true
wo.cursorcolumn     = false         -- highlight column
wo.number           = true
wo.relativenumber   = true
wo.nuw              = 3
opt.ruler           = true
wo.signcolumn       = 'yes'
opt.autowrite       = true
opt.autoread        = true

-- TABS
opt.tabstop         = Arunvi.option.tabwidth
opt.shiftwidth      = Arunvi.option.tabwidth
opt.autoindent      = true
opt.expandtab       = true

opt.backspace       = 'indent,eol,start'
opt.showcmd         = true
opt.laststatus      = 2
opt.shiftround      = true
opt.smartindent     = true
opt.linebreak       = false         -- wrap whole word when wrap is enable
opt.termguicolors   = true
opt.fillchars       = 'msgsep:─,lastline: ,eob: ,vert:▕,vertright:▕,vertleft:▕,verthoriz:▕,horizup:─,horizdown:─' --▕▏
opt.list            = true
opt.listchars       = 'trail:~,space: ,eol:↵,tab:  ' -- ',tab:·,eol:¬,eol:↵,extends:>,precedes:<,'
-- opt.guifont         = "JetBrainsMono NFM"

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 999

-- Disable various builtin plugins in Vim
g.loaded_matchparen = 0
g.loaded_matchit = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_tarPlugin = 1
g.loaded_gzip = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_shada_plugin = 1
g.loaded_spellfile_plugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_remote_plugins = 1
