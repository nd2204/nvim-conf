vim.cmd("filetype plugin indent on")

local g = vim.g
local opt = vim.opt
local wo = vim.wo

g.mapleader = G.Core.Leader
g.maplocalleader = G.Core.LocalLeader
g.guicursor = ""
g.editorconfig = true

-- fall back to netrw when no file explorer plugins enabled
g.loaded_netrw = G.Helper.Dependencies.HasFileExplorerPlugin() and 1 or 0
g.loaded_netrwPlugin = G.Helper.Dependencies.HasFileExplorerPlugin() and 1 or 0
g.netrw_banner = 0
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_tarPlugin = 1
g.loaded_gzip = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_shada_plugin = 0
g.loaded_spellfile_plugin = 1
g.loaded_remote_plugins = 1

-- opt.shortmess              = vim.o.shortmess .. 'aoOstTWI'
opt.cmdheight = G.UI.CmdHeight -- Set nvim command height
opt.number = true -- enable number column
opt.relativenumber = true -- enable relativenumber
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.scrolloff = 10 -- spare n line between your cursor and the horizontal side of the screen when scroll
opt.sidescrolloff = 5 -- spare n characters between your cursor and the vertical side of the screen when scroll
opt.ignorecase = true -- enable case sensitivity
opt.splitbelow = true -- set spliting position below for horizontal spliting as defaults
opt.splitright = true -- set spliting position right for vertical spliting as defaults
opt.showmode = false -- No more --Insert-- indication in nvim cmd
opt.showtabline = G.UI.TabLine and 2 or 1 -- show tabs line (0: never, 1: only when >= 2 tabs, 2: always)
opt.whichwrap = "b,s,<,>,[,]" -- allow cursor to wrap to the next/previous line when pressing the key
opt.fileencoding = "utf-8" -- set file encoding
opt.textwidth = 120 -- set max characters on a line
opt.pumheight = 0 -- Maximum number of items to show in the popup menu. (0: "use available screen space").
opt.tabstop = 8 -- Number of spaces that a <Tab> in the file counts for.
opt.softtabstop = G.Core.Indent -- Controls how many spaces are inserted or deleted when pressing <Tab> or <Backspace>
opt.shiftwidth = G.Core
.Indent -- Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
opt.autoindent = true -- Set auto indent when starting a new line
opt.expandtab = true -- Turn tabs into spaces (should be avoided when using wide tabstop)
opt.autowrite = true -- Write the contents of the file, if it has been modified, on each `:next`, `:rewind`, etc
opt.autoread = true -- Auto reread the file when it changed outside nvim
opt.termguicolors = true --	Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight| attributes instead of "cterm" attributes.
opt.smartindent = true -- auto indenting
opt.shiftround = true --	Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
opt.laststatus = 3 -- The value of this option influences when the last window will have a status line: (0: never, 1: only if there are at least two windows, 2: always, 3: always and ONLY the last window)
opt.foldmethod = "expr" -- Set the folding method
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Set the foldexpr
opt.foldlevelstart = 999 -- Set the fold level start
opt.swapfile = false -- Use a swapfile for buffer
opt.inccommand = "split" -- show a windows of changes when substitude using :s
-- opt.winborder              = "rounded"                    -- set window border for lsp like hover and docs
opt.list = true -- List mode: By default, show tabs as ">", trailing spaces as "-", and non-breakable space characters as "+".
opt.listchars:append("trail:~,space: ,eol:↵,tab:  ") -- ',tab:·,eol:¬,eol:↵,extends:>,precedes:<,'

opt.clipboard:append("unnamedplus")
opt.fillchars:append("lastline: ,eob: ")
-- opt.fillchars:append('msgsep:─,lastline: ,eob: ,vert:▕,vertright:▕,vertleft:▕,verthoriz:▕,horizup:─,horizdown:─') --▕▏

-- options for the current window
wo.wrap = false                                   -- Enable line wrapping
wo.linebreak = false                              -- Wrap whole word when wrap is enable
wo.colorcolumn = G.UI.ColorColumn and "+1" or 0   -- Highlight column after 'textwidth'
wo.signcolumn = G.UI.SignColumn and "yes" or "no" -- enable the column before the number column for gitsign or lsp
wo.cursorline = true                              -- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
wo.cursorcolumn = false                           -- Highlight the column line of the cursor with CursorLine |hl-CursorLine|.
