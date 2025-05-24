local colors = require("core.colors").GetPallete(G.UI.Theme.Mode)

local opacity = G.UI.Theme.Transparent and 0.75 or 1.0

if G.Helper.IsMac() then
  vim.o.guifont = "RobotoMono Nerd Font:h14.5:b"
  vim.g.neovide_show_border = true
  vim.g.neovide_floating_shadow = false
elseif G.Helper.IsWin() then
  vim.g.neovide_title_background_color = G.UI.Theme.Transparent and "none" or colors.bg0
  vim.g.neovide_title_text_color = colors.fg0
  vim.o.guifont = "RobotoMono Nerd Font:h9:b"
  vim.g.terminal_emulator = 'powershell'
else
  vim.o.guifont = "RobotoMono Nerd Font:h9:b"
end
vim.opt.linespace = 4

vim.g.neovide_position_animation_length = 0.08
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_scroll_animation_length = 0.08
vim.g.neovide_window_blurred = true
vim.g.neovide_opacity = opacity
vim.g.neovide_normal_opacity = opacity
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_remember_window_size = true

vim.g.neovide_padding_top = 6
vim.g.neovide_padding_bottom = 6
vim.g.neovide_padding_right = 6
vim.g.neovide_padding_left = 6
