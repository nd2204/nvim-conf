-- local themes = require('telescope.themes').get_dropdown({ previewer = false })
-- local findbuffer = "<cmd>lua require'telescope.builtin'.buffers(" .. themes .. ")<CR>"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local fn_copy_cur_buf_filepath = function()
  local filepath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filepath)
  vim.notify("Copied filepath: " .. filepath)
end

local fn_open_global_config_file = function()
  vim.api.nvim_cmd(
    vim.api.nvim_parse_cmd("e " .. vim.fn.stdpath("config") .. "/lua/core/globals.lua", {}),
    {}
  )
end

keymap('n', 'J', 'mzJ`z', opts)
keymap('n', '<Space>', '<NOP>', opts)
keymap('n', '<ESC>', ':nohlsearch<CR>', opts)
-- Navigate buffers
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-l>', ':bnext<CR>', opts)
-- Navigate between quickfix items
keymap('n', ']q', ':cnext<CR>zz', { desc = 'Forward Quickfix List' })
keymap('n', '[q', ':cprev<CR>zz', { desc = 'Backward Quickfix List' })
-- Navigate between quickfix items
keymap('n', ']l', ':lnext<CR>zz', { desc = 'Forward Quickfix List' })
keymap('n', '[l', ':lprev<CR>zz', { desc = 'Backward Quickfix List' })
-- Navigate tabs
keymap('n', '<Tab>', '<cmd>tabnext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>tabprevious<CR>', opts)
-- Resize pane with arrow keymap
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Resize pane with meta/alt key
keymap('n', '<M-h>', ':vertical resize -2<CR>', opts)
keymap('n', '<M-l>', ':vertical resize +2<CR>', opts)
-- (theprimeagen keymap)
keymap('x', '<leader>p', "\"_dP", { desc = "Put without overwrite" })
keymap({ 'n', 'v' }, '<leader>y', "\"+y", { desc = "Yank without overwrite" })
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
-- Move text up and down
keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
-- Move text up and down
keymap("x", "J", ":move \'>+1<CR>gv=gv", opts)
keymap("x", "K", ":move \'<-2<CR>gv=gv", opts)
-- Navigate tabs
keymap('n', '<leader>to', ':tabnew<CR>', { desc = "Open new tab" })
keymap('n', '<leader>tx', ':tabclose<CR>', { desc = "Close current tab" })
keymap('n', '<leader>tn', ':tabnext<CR>', { desc = "Go to next tab" })
keymap('n', '<leader>tp', ':tabprevious<CR>', { desc = "Go to previous tab" })

keymap('n', "Q", "<nop>")
keymap('n', "q:", "<nop>")
keymap('n', "<leader>x", "<CMD>bdelete!<CR>", { desc = "Close Buffer Force" })
keymap('n', "<leader>q", "<CMD>qa!<CR>", { desc = "Force exit nvim" })
keymap('n', "<leader>w", "<CMD>w!<cr>", { desc = "Force write buffer" })
keymap('n', "<leader>L", "<CMD>Lazy<CR>", { desc = "Package Manager" })
keymap('n', "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace all under cursor", silent = false })
keymap("n", "<leader>G", fn_open_global_config_file, { desc = "Edit Global File" })
keymap("n", "<leader>fp", fn_copy_cur_buf_filepath, { desc = "Copy file path to clipboard" })
if not G.Helper.Dependencies.HasFileExplorerPlugin() then
  keymap("n", "<leader>e", vim.cmd.Ex, { desc = "Open File Explorer" })
end
