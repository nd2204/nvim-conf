local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 500

wk.setup()

local mappings = {
    {"<leader>j",  "<CMD>lua require('treesj').toggle()<CR>", desc="Toggle breakline" },
    {
        group = "LSP",
       {"<leader>li", ":LspInfo<cr>", desc="Connected Language Servers"},
        {"<leader>lk", '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc="Signature help"},
        {"<leader>lK", desc="Hover doc (use K instead)"},
        {"<leader>lw", '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc="Add workspace folder"},
        {"<leader>lW", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc="Remove workspace folder"},
        {"<leader>ll", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc="List workspace folder" },
        {
            group = "Go to ... definition",
            {"<leader>lgd", '<cmd>lua vim.lsp.buf.definition()<CR>', desc="Go to definition"},
            {"<leader>lgt", desc="Peek type definition"},
        },
        {"<leader>lt", desc="Peek type definition"},
        {"<leader>ld", desc="Peek definition"},
        {"<leader>lD", '<cmd>lua vim.lsp.buf.delaration()<CR>', desc="Go to declaration"},
        {"<leader>lr", '<cmd>lua vim.lsp.buf.references()<CR>', desc="References"},
        {"<leader>lR", desc="Rename"},
        {"<leader>la", desc="Code actions"},
        {"<leader>le", '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', desc="Show line diagnostics"},
        {"<leader>lj", desc="Next diagnostic"},
        {"<leader>lJ", desc="Previous diagnostic"},
        {"<leader>lI", '<cmd>Mason<cr>', desc='Install language server'},
        {"<leader>lF", desc="Format File"},
        {
            name = "Call hierachy",
            {"<leader>lci", desc="inbound"},
            {"<leader>lco", desc="out"}
        },
    },
    {
        name = "Search/Telescope",
        {"<leader>fd", '<cmd>Telescope diagnostics bufnr=0<CR>', desc="Diagnostics"},
        {"<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", desc="Cwd Files"},
        {"<leader>fo", "<cmd>Telescope oldfiles<cr>", desc="Recent File"},
        {"<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep(require'telescope.themes'.get_ivy({previewer = false}))<cr>", desc="Grep"},
        {"<leader>fh", "<CMD>Telescope help_tags",desc="Help Tags"},
        {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc="Keymaps"},
        {"<leader>fb", "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", desc="Current Buffer"},
        {"<leader>fB", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown({previewer = false}))<cr>", desc="Current Buffer"},
    },
    { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc="Directory tree"},
    {
        name = "Terminal",
        {"<leader>ta", "<CMD>ToggleTerm direction=float<CR>", desc="Floating" },
        {"<leader>tl", "<CMD>lua Arunvi.plugins.toggleterm.lazygit()<CR>", desc="LazyGit" },
        {"<leader>tp", "<CMD>lua Arunvi.plugins.toggleterm.btop()<CR>", desc="Process Manager" },
        {"<leader>tb", "<CMD>lua Arunvi.plugins.toggleterm.bs()<CR>", desc="Live Server" },
    },
    {"<leader>r", "<CMD>lua Arunvi.plugins.toggleterm.make()<CR>", desc="Run Makefile" },
    {"<leader>x", "<CMD>bdelete<cr>", desc="Close Buffer"},
    {"<leader>X", "<CMD>bdelete!<cr>", desc="Close Buffer Force"},
    {"<leader>q", "<CMD>q<CR>", desc="Exit Nvim"},
    {"<leader>Q", "<CMD>q!<cr>", desc="Force Quit"},
    {"<leader>w", "<CMD>w<CR>", desc="Write"},
    {"<leader>W", "<CMD>w!<cr>", desc="Force Write"},
    {"<leader>L", "<CMD>Lazy<CR>", desc="Package Manager"},
    {"<leader>E", "<CMD>e " .. vim.fn.stdpath("config") .. "/lua/arunvi/init.lua<cr>", desc="Edit Config File"},
}

local prefix = {prefix = "<leader>"}

if Arunvi.helper.tmuxIsRunning() then
    vim.g.VimuxHeight = "20"
    wk.add({
        { "<leader>tp", "<CMD>VimuxPromptCommand<CR>", desc="Prompt Command" },
        { "<leader>tt", "<CMD>VimuxTogglePane<CR>", desc="toggle Vimux" },
        { "<leader>ts", "<CMD>VimuxOpenRunner<CR>", desc="toggle Vimux" },
        { "<leader>tS", "<CMD>VimuxCloseRunner<CR>", desc="toggle Vimux" },
    })
elseif Arunvi.helper.zellijIsRunning() then
    -- wk.register({
    -- },prefix)
else
    wk.add({
      { "<leader>tt", "<cmd>ToggleTerm direction=vertical<cr>", desc="Split vertical" },
      { "<leader>ts", "<cmd>ToggleTerm direction=horizontal<cr>", desc="Split Below" },
    })
end

wk.add(mappings,prefix)
