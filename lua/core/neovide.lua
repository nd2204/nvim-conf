local colors = require("core.colors").GetPallete(G.UI.Theme.Mode)

local opacity = G.UI.Theme.Transparent and 0.75 or 1.0
local opacity_hex = string.format("%x", opacity * 255)

if G.Helper.IsMac() then
  vim.o.guifont = "RobotoMono Nerd Font Mono:h14.5:b"
else
  vim.o.guifont = "RobotoMono Nerd Font Mono:h9.5:b"
end
vim.opt.linespace = 6

vim.g.neovide_title_background_color = G.UI.Theme.Transparent and "none" or colors.bg1
vim.g.neovide_title_text_color = colors.fg0

vim.g.neovide_position_animation_length = 0.08
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_scroll_animation_length = 0.08
vim.g.neovide_window_blurred = true
vim.g.neovide_opacity = opacity
vim.g.neovide_normal_opacity = opacity
vim.g.neovide_show_border = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_remember_window_size = true
