local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 500

wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPACE",
        ["<cr>"] = "RETURN",
        ["<tab>"] = "TAB",
    },
    motions = {
        count = true,
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = false, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_nowait = {
        -- marks

        "`",
        "'",
        "g`",

        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",

    },

    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey

        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = {},
    },
})

local mappings = {
    ["/"] = {"<CMD>Commentary<CR>", "Toggle Comment"},
    ["j"] = { "<CMD>lua require('treesj').toggle()<CR>", "Toggle breakline" },
    ["l"] = {
        name = "LSP",
        ["i"] = {":LspInfo<cr>", "Connected Language Servers"},
        ["k"] = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature help"},
        ["K"] = {"Hover doc (use K instead)"},
        ["w"] = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
        ["W"] = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
        ["l"] = {
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            "List workspace folder"
        },
        ["g"] = {
            name = "Go to ... definition",
            d = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
            t = {"Peek type definition"},
        },
        ["t"] = {"Peek type definition"},
        ["d"] = {"Peek definition"},
        ["D"] = {'<cmd>lua vim.lsp.buf.delaration()<CR>', "Go to declaration"},
        ["r"] = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},
        ["R"] = {"Rename"},
        ["a"] = {"Code actions"},
        ["e"] = {'<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
        ["j"] = {"Next diagnostic"},
        ["J"] = {"Previous diagnostic"},
        ["I"] = {'<cmd>Mason<cr>', 'Install language server'},
        ["F"] = {"Format File"},
        ["c"] = {
            name = "Call hierachy",
            i = {"inbound"},
            o = {"out"}
        },
    },
    ["f"] = {
        name = "Search/Telescope",
        ["d"] = {'<cmd>Telescope diagnostics bufnr=0<CR>', "Diagnostics"},
        ["f"] = {"<cmd>lua require'telescope.builtin'.find_files(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", "Cwd Files"},
        ["o"] = {"<cmd>Telescope oldfiles<cr>", "Recent File"},
        ["g"] = {"<cmd>lua require'telescope.builtin'.live_grep(require'telescope.themes'.get_ivy({previewer = false}))<cr>", "Grep"},
        ["h"] = {"<CMD>Telescope help_tags", "Help Tags",},
        ["k"] = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
        ["b"] = {"<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", "Current Buffer"},
        ["B"] = {"<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", "Current Buffer"},
    },
    t = {
        name = "Terminal",
        a = { "<CMD>ToggleTerm direction=float<CR>", "Floating" },
        l = { "<CMD>lua Arunvi.plugins.toggleterm.lazygit()<CR>", "LazyGit" },
        p = { "<CMD>lua Arunvi.plugins.toggleterm.btop()<CR>", "Process Manager" },
        b = { "<CMD>lua Arunvi.plugins.toggleterm.bs()<CR>", "Live Server" },
    },
    r = { "<CMD>lua Arunvi.plugins.toggleterm.make()<CR>", "Run Makefile" },
    x = { ":bdelete<cr>", "Close Buffer"},
    X = { ":bdelete!<cr>", "Close Buffer Force"},
    q = { ":q<CR>", "Exit Nvim"},
    Q = { ":q!<cr>", "Force Quit"},
    w = { ":w<CR>", "Write"},
    W = { ":w!<cr>", "Force Write"},
    e = { "<cmd>NvimTreeFindFileToggle<CR>", " Directory tree"},
    E = { ":e ~/.config/nvim/lua/arunvi/init.lua<cr>", "Edit Config File"},
    L = { ":Lazy<cr>", "Package Manager"},
    z = {
        name = "Focus Mode",
        z = {":ZenMode<cr>", "Toggle Zen Mode"},
        t = {":Twilight<cr>", "Toggle Twilight"}
    },
}

local prefix = {prefix = "<leader>"}

if Arunvi.helper.tmuxIsRunning() then
    vim.g.VimuxHeight = "20"
    wk.register({
        p = { "<CMD>VimuxPromptCommand<CR>", "Prompt Command" },
        t = {
            t = { "<CMD>VimuxTogglePane<CR>", "toggle Vimux" },
            s = { "<CMD>VimuxOpenRunner<CR>", "toggle Vimux" },
            S = { "<CMD>VimuxCloseRunner<CR>", "toggle Vimux" },
        }
    },prefix)
elseif Arunvi.helper.zellijIsRunning() then
    -- wk.register({
    -- },prefix)
else
    wk.register({
        t = {
            t = { "<cmd>ToggleTerm direction=vertical<cr>", "Split vertical" },
            s = { "<cmd>ToggleTerm direction=horizontal<cr>", "Split Below" },
        }
    },prefix)
end

wk.register(mappings,prefix)
