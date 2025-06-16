return {
  { 'echasnovski/mini.nvim', version = '*' },
  G.Plugins.minifile and {
    'echasnovski/mini.files',
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        mappings = {
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "<BS>",
          go_out_plus = "H"
        }
      })
      vim.keymap.set("n", "<leader>-", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "Toggle mini's file explorer" })
      vim.keymap.set("n", "<leader>e", function()
        MiniFiles.open()
      end, { desc = "Show parents directory" })
    end
  },
  G.Plugins.splitjoin and {
    'echasnovski/mini.splitjoin',
    config = function()
      local MiniSplitJoin = require("mini.splitjoin")
      MiniSplitJoin.setup()
      vim.keymap.set({ "n", "x" }, "<leader>j", function() MiniSplitJoin.toggle() end,
        { desc = "Toggle mini split join" })
    end
  },
}
