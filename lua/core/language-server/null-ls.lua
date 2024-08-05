-- local null_ls_status_ok, null_ls = pcall(require, "null-ls")

-- if not null_ls_status_ok then
--     return
-- end

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local null_ls_servers = {
  "mypy",
  "ruff",
  "prettier",
  "black",
  "stylua",
}

require("mason-null-ls").setup({
  ensure_installed = null_ls_servers,
  automatic_installation = true,
})

null_ls.setup({
  debug = true,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    diagnostics.mypy,
    diagnostics.ruff,
  },
})
