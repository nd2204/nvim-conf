-- local themes = require('telescope.themes').get_dropdown({ previewer = false })
-- local findbuffer = "<cmd>lua require'telescope.builtin'.buffers(" .. themes .. ")<CR>"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

keymap('n', 'J', 'mzJ`z', opts)
keymap('n', '<Space>', '<NOP>', opts)
keymap('n', '<ESC>', ':nohlsearch<CR>', opts)
-- Navigate buffers
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-l>', ':bnext<CR>', opts)
-- Navigate tabs
keymap('n', '<F3>', ':tabnew<CR>', opts)
keymap('n', 'th', ':tabnext<CR>', opts)
keymap('n', 'tl', ':tabprevious<CR>', opts)
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

if vim.g.loaded_netrw ~= 1 then
  keymap("n", "<leader>e", vim.cmd.Ex, { desc = "Open File Explorer" })
else
  vim.notify("");
  -- keymap("n", "<leader>e", vim.cmd.Ex, { desc = "Open File Explorer" })
end

keymap("n", "<leader>G", "<CMD>e " .. vim.fn.stdpath("config") .. "/lua/core/globals.lua<cr>",
  { desc = "Edit Global File" })

local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
