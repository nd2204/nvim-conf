return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set

        opts.desc = "Show LSP reference"
        map("n", "<leader>lr", "<CMD>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        map("n", "<leader>lD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        map("n", "<leader>ld", "<CMD>Telescope lsp_definitions<CR>", opts)
        map("n", "gd", "<CMD>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Diagnostic: Go to next"
        map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        opts.desc = "Diagnostic: Go to previous"
        map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

        opts.desc = "Show LSP implementation"
        map("n", "<leader>li", "<CMD>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        map("n", "<leader>lt", "<CMD>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        map({ "n", "v" }, "<leader>la", function() vim.lsp.buf.code_action() end, opts)

        opts.desc = "Smart rename"
        map({ "n", "v" }, "<leader>lR", vim.lsp.buf.rename, opts)

        opts.desc = "Show documentation for what is under the cursor"
        map("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        map("n", "<leader>ls", "<CMD>LspRestart<CR>", opts)

        opts.desc = "Show signature help"
        map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end
    })

    local signs = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "H",
      [vim.diagnostic.severity.INFO] = "I",
    }

    vim.diagnostic.config({
      signs = {
        text = signs,
      },
      underline = true,
      virtual_text = false,
      update_in_insert = false,
      severity_sort = true,
      -- float = {
      --   focusable = false,
      --   style = "minimal",
      --   border = "rounded",
      --   source = "always",
      --   header = "",
      --   prefix = "",
      -- },
    })
  end
}
