local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = function(term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = -30,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.o.shell,
    auto_scroll = true,
    highlights = {
        Normal = {
            link = 'NvimTreeNormal'
        },
        NormalFloat = {
            link = 'Normal'
        },
        FloatBorder = {
            link = 'Grey'
        }
    },
    float_opts = {
        border = "single",
        winblend = 0,
    },
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
})

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end



vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
