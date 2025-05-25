local theme = Arunvi.option.background.colorscheme local _, cls = pcall(require, "core.plugin_config.colorscheme." .. theme)
if not _ then
  vim.notify("Failed to load config file " .. theme .. ".lua")
  return
end

local M = {}

local colors = cls.getcolors()
-- local signcolor = colors.bg_1;
local signBg = nil;

M.theme = colors
-- Run the colorscheme setup function
cls.setup()
local hl = vim.api.nvim_set_hl
--------------------------------- Override default color --------------------------------
hl(0, "Fg",           {ctermfg = 223, bg = nil, fg = colors.fg_0 })
hl(0, "Grey",         {ctermfg = 245, bg = nil, fg = colors.grey_0 })
hl(0, "GreySign",     {ctermfg = 245, bg = nil, fg = colors.grey_0 })
hl(0, "GreyBold",     {ctermfg = 245, bg = nil, fg = colors.grey_0 })
hl(0, "GreyItalic",   {ctermfg = 245, bg = nil, fg = colors.grey_0 })
hl(0, "Red",          {ctermfg = 167, bg = nil, fg = colors.red })
hl(0, "RedSign",      {ctermfg = 167, bg = nil, fg = colors.red })
hl(0, "RedBold",      {ctermfg = 167, bg = nil, fg = colors.red })
hl(0, "RedItalic",    {ctermfg = 167, bg = nil, fg = colors.red })
hl(0, "Yellow",       {ctermfg = 214, bg = nil, fg = colors.yellow })
hl(0, "YellowSign",   {ctermfg = 214, bg = nil, fg = colors.yellow })
hl(0, "YellowBold",   {ctermfg = 214, bg = nil, fg = colors.yellow })
hl(0, "YellowItalic", {ctermfg = 214, bg = nil, fg = colors.yellow })
hl(0, "Orange",       {ctermfg = 208, bg = nil, fg = colors.orange })
hl(0, "OrangeSign",   {ctermfg = 208, bg = nil, fg = colors.orange })
hl(0, "OrangeBold",   {ctermfg = 208, bg = nil, fg = colors.orange })
hl(0, "OrangeItalic", {ctermfg = 208, bg = nil, fg = colors.orange })
hl(0, "Green",        {ctermfg = 142, bg = nil, fg = colors.green })
hl(0, "GreenSign",    {ctermfg = 142, bg = nil, fg = colors.green })
hl(0, "GreenBold",    {ctermfg = 142, bg = nil, fg = colors.green })
hl(0, "GreenItalic",  {ctermfg = 142, bg = nil, fg = colors.green })
hl(0, "Aqua",         {ctermfg = 108, bg = nil, fg = colors.aqua })
hl(0, "AquaSign",     {ctermfg = 108, bg = nil, fg = colors.aqua })
hl(0, "AquaBold",     {ctermfg = 108, bg = nil, fg = colors.aqua })
hl(0, "AquaItalic",   {ctermfg = 108, bg = nil, fg = colors.aqua })
hl(0, "Blue",         {ctermfg = 109, bg = nil, fg = colors.blue })
hl(0, "BlueSign",     {ctermfg = 109, bg = nil, fg = colors.blue })
hl(0, "BlueBold",     {ctermfg = 109, bg = nil, fg = colors.blue })
hl(0, "BlueItalic",   {ctermfg = 109, bg = nil, fg = colors.blue })
hl(0, "Purple",       {ctermfg = 175, bg = nil, fg = colors.purple })
hl(0, "PurpleSign",   {ctermfg = 175, bg = nil, fg = colors.purple })
hl(0, "PurpleBold",   {ctermfg = 175, bg = nil, fg = colors.purple })
hl(0, "PurpleItalic", {ctermfg = 175, bg = nil, fg = colors.purple })
---------------------------------------- Builtin ----------------------------------------
hl(0, "Cursorline",         { bg = nil })
hl(0, "CursorlineNr",       { bg = nil, fg = colors.fg_1 })
hl(0, "SignColumn",         { bg = colors.bg_4 })
hl(0, "GreenSign",          { ctermfg = 147, bg = signBg, fg = colors.green,})
hl(0, "RedSign",            { ctermfg = 167, bg = signBg, fg = colors.red})
hl(0, "BlueSign",           { ctermfg = 109, bg = signBg, fg = colors.blue})
hl(0, "YellowSign",         { ctermfg = 214, bg = signBg, fg = colors.yellow})
hl(0, "PurpleSign",         { ctermfg = 175, bg = signBg, fg = colors.purple})
hl(0, "OrangeSign",         { ctermfg = 208, bg = signBg, fg = colors.orange})
hl(0, "AquaSign",           { ctermfg = 108, bg = signBg, fg = colors.aqua})
hl(0, "CurrentWord",        { bg = colors.bg_3 })
hl(0, "FloatBorder",        { bg = nil, fg = colors.bg_5 })
hl(0, "LineNr",             { fg = colors.bg_5 })
hl(0, "Normal",             { bg = colors.bg_0, fg = colors.fg_0 })
hl(0, "NormalFloat",        { bg = colors.bg_0, fg = colors.fg_0 })
hl(0, "Terminal",           { bg = colors.bg_dim, fg = colors.fg_0 })
hl(0, "VertSplit",          { bg = colors.bg_dim, fg = colors.bg_3 })
hl(0, "WinSeparator",       { bg = nil, fg = colors.bg_4 })
hl(0, "MsgSeparator",       { bg = nil, fg = colors.grey_0 })
-- hl(0, "ColorColumn",        { ctermbg = 236, bg = colors.bg_1 })
hl(0, "ColorColumn",        { ctermbg = 236, bg = nil })
-- Uis --
hl(0, "NormalNC",           { link = "Normal" })
hl(0, "Visual",             { bg = colors.bg_2 })
hl(0, "EndOfBuffer",        { fg = colors.bg_5 })
hl(0, "NonText",            { fg = colors.bg_1 })
hl(0, "StatusLine",         { link = "NvimTreeNormal" })
hl(0, "StatusLineNC",       { link = "NormalNC" })
hl(0, "WhiteSpace",         { fg = colors.bg_2 })
hl(0, "Comment",            { bg=nil, fg=colors.grey_1})
hl(0, "Search",             { bg=nil, bold=true, underline=true})
hl(0, "IncSearch",          { fg=colors.bg_0, bg=colors.green, bold=true})
hl(0, "VirtualTextHint",    { fg=colors.blue, bg="#2e3b3b"})
hl(0, "VirtualTextInfo",    { fg=colors.blue, bg="#2e3b3b"})
hl(0, "VirtualTextError",   { fg=colors.red, bg="#442e2d"})
hl(0, "VirtualTextWarning", { fg=colors.yellow, bg="#473c29"})
---------------------------------------- Plugins ----------------------------------------
-- WhichKey --
hl(0, "WhichKeyFloat",          { link = "NvimTreeNormal" })
hl(0, "WhichKeySeparator",      { bg = nil, fg = colors.grey_0})
hl(0, "WhichKeyDesc",           { bg = nil, fg = colors.fg_0})
-- NvimTree --
hl(0, "NvimTreeNormal",         { bg = colors.bg_dim, fg = colors.fg_0 })
hl(0, "NvimTreeEndOfBuffer",    { fg = colors.bg_dim })
hl(0, "NvimTreeWinSeparator",   { bg = colors.bg_dim, fg = colors.bg_dim})
hl(0, "NvimTreeVertSplit" ,     { bg = colors.bg_dim, fg = colors.bg_dim})
hl(0, "NvimTreeCursorLine" ,    { bg = colors.bg_0 } )
hl(0, "NvimTreeCursorLineNr" ,  { bg = colors.bg_0 } )
hl(0, "NvimTreeIndentMarker",   { link = "IndentBlanklineChar" } )
hl(0, "NvimTreeGitNew",         { link = "Yellow" } )

---------------------------------------- Syntax ----------------------------------------

-- Treesitter --
hl(0, "TSPunctBracket",         { bg = nil, fg = colors.grey_0 })
hl(0, "Identifier",             { bg = nil, fg = colors.fg_0 })
hl(0, "TSFunctionCall",         { link = "Function" })
hl(0, "TSFuncBuiltin",          { link = "Function" })
hl(0, "TSFuncMacro",            { link = "Function" })
hl(0, "TSFunction",             { link = "Function" })
hl(0, "TSMethod",               { link = "Function" })
hl(0, "TSMethodCall",           { link = "Function" })
hl(0, "TSString",               { bg = nil, fg = colors.green })
hl(0, "TSConditional",          { link = "TSKeyword" })
hl(0, "TSKeywordFunction",      { link = "TSKeyword" })
hl(0, "TSKeywordReturn",        { link = "TSKeyword" })
hl(0, "TSTypeDefinition",       { bg = nil, fg = colors.red })
hl(0, "TSInclude",               { link = "TSPreProc" })
hl(0, "@lsp.type.enumMember",   { bg = nil, fg = colors.blue })
hl(0, "TSComment",              { link = "Comment" })
-- Telescope --
hl(0, "TelescopeSelection",     { bg = colors.bg_1 })
hl(0, "TelescopeBorder",        { fg = colors.bg_5 })
hl(0, "TelescopeResultsBorder", { link = "TelescopeBorder" })
hl(0, "TelescopePromptBorder",  { link = "TelescopeBorder" })
hl(0, "TelescopePreviewBorder", { link = "TelescopeBorder" })
-- IndentBlankline --
hl(0, "IndentBlanklineChar",    { bg = nil, fg = colors.bg_2 })
-- Gitsign
hl(0, "GitSignsChange",         { bg = nil, fg = colors.blue})
hl(0, "GitSignsAdd",            { bg = nil, fg = colors.bg_5 })
hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

local istransparent = Arunvi.option.background.transparent
if istransparent then
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi NormalFloat ctermbg=NONE guibg=NONE')
  vim.cmd('hi FloatBorder ctermbg=NONE guibg=NONE')
  vim.cmd('hi Winbar ctermbg=NONE guibg=NONE') --tranparent winbar
  vim.cmd('hi WinbarNC ctermbg=NONE guibg=NONE') --tranparent winbar
  vim.cmd('hi NormalNC ctermbg=NONE guibg=NONE') --tranparent winbar

  vim.cmd('hi WinSeparator ctermbg=NONE guibg=NONE')
  vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
  vim.cmd('hi NvimTreeVertSplit guibg=NONE')
  vim.cmd('hi VertSplit guibg=NONE')
  vim.cmd('hi WinSeparator guibg=NONE')
  vim.cmd('hi Cursorline ctermbg=240 guibg=NONE gui=NONE')

  hl(0, "GreenSign",          { ctermfg = 147, bg = nil, fg = colors.green,})
  hl(0, "RedSign",            { ctermfg = 167, bg = nil, fg = colors.red})
  hl(0, "BlueSign",           { ctermfg = 109, bg = nil, fg = colors.blue})
  hl(0, "YellowSign",         { ctermfg = 214, bg = nil, fg = colors.yellow})
  hl(0, "PurpleSign",         { ctermfg = 175, bg = nil, fg = colors.purple})
  hl(0, "OrangeSign",         { ctermfg = 208, bg = nil, fg = colors.orange})
  hl(0, "AquaSign",           { ctermfg = 108, bg = nil, fg = colors.aqua})

  hl(0, "NvimTreeNormal",         { bg = nil, fg = colors.fg_0 })
  hl(0, "NvimTreeOpenedHL",       { bg = nil, fg = colors.aqua })
  hl(0, "NvimTreeEndOfBuffer",    { fg = nil })
  hl(0, "NvimTreeWinSeparator",   { bg = nil, fg = colors.bg_4})
  hl(0, "NvimTreeVertSplit" ,     { bg = nil, fg = colors.bg_4})
  hl(0, "NvimTreeCursorLine" ,    { bg = colors.bg_1 } )
  hl(0, "NvimTreeCursorLineNr" ,  { bg = colors.bg_1 } )

  hl(0, "Visual",             { bg = colors.bg_5 })

  vim.opt.fillchars       = 'msgsep:─,lastline:~,eob: ,vert:▕,vertright:▕,vertleft:▕,verthoriz:▕,horizup:─,horizdown:─' --▕▏
  vim.opt.listchars       = 'trail: ,space: ,eol:↵' -- ',tab:·,eol:¬,eol:↵,extends:>,precedes:<,'

  vim.cmd('hi ToggleTerm1Normal ctermbg=NONE guibg=NONE')
end

return M
