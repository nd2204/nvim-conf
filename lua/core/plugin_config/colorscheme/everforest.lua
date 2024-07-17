local M = {}

local theme = {
    bg_dim  = { ["dark"] = "#1e2326", ["light"] = "#e5dfc5" },
    bg_0    = { ["dark"] = "#272e33", ["light"] = "#f3ead3" },
    bg_1    = { ["dark"] = "#2e383c", ["light"] = "#eae4ca" },
    bg_2    = { ["dark"] = "#374145", ["light"] = "#e5dfc5" },
    bg_3    = { ["dark"] = "#414b50", ["light"] = "#ddd8be" },
    bg_4    = { ["dark"] = "#374145", ["light"] = "#d8d3ba" },
    bg_5    = { ["dark"] = "#4f5b58", ["light"] = "#b9c0ab" },
    grey_0  = { ["dark"] = "#7a8478", ["light"] = "#a6b0a0" },
    grey_1  = { ["dark"] = "#859289", ["light"] = "#939f91" },
    grey_2  = { ["dark"] = "#9da9a0", ["light"] = "#829181" },
    fg_0    = { ["dark"] = "#d3c6aa", ["light"] = "#5c6a72" },
    fg_1    = { ["dark"] = "#d3c6aa", ["light"] = "#708089" },
    red     = { ["dark"] = "#e67e80", ["light"] = "#f85552" },
    orange  = { ["dark"] = "#e69875", ["light"] = "#f57d26" },
    yellow  = { ["dark"] = "#dbbc7f", ["light"] = "#dfa000" },
    green   = { ["dark"] = "#a7c080", ["light"] = "#8da101" },
    aqua    = { ["dark"] = "#83c092", ["light"] = "#35a77c" },
    blue    = { ["dark"] = "#7fbbb3", ["light"] = "#3a94c5" },
    purple  = { ["dark"] = "#d699b6", ["light"] = "#df69ba" },
    accent  = { ["dark"] = "#a7c080", ["light"] = "#8da101" },
}

M.getcolors = function(mode)
    mode = mode or Arunvi.option.background.mode
    local colors = {}
    for i, v in pairs(theme) do
        colors[i] = v[mode]
    end
    return colors
end

M.setup = function ()
    local colorscheme = "everforest"
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
        return
    end

    vim.g.everforest_background = "hard";
    vim.g.everforest_enable_bold = 1;
    vim.g.everforest_enable_italic = 1;
    vim.cmd("set background=" .. Arunvi.option.background.mode);
    vim.g.everforest_dim_inactive_windows = Arunvi.option.background.dim and 1 or 0;
    vim.g.everforest_transparent_background = Arunvi.option.background.transparent and 2 or 0;

    -- vim.g.everforest_visual = 'string_here'; -- see h: gruvbox-material
    vim.g.everforest_ui_contrast = "high";
    vim.g.everforest_disable_terminal_colors = 1; -- maintain your terminal color inside nvim

    vim.cmd([[colorscheme everforest]])
    -- local colors = M.getcolors(Arunvi.option.background.mode)
    -- vim.api.nvim_set_hl(0, "TSPunctBracket",            { bg = nil, fg = colors.orange })
end

return M
