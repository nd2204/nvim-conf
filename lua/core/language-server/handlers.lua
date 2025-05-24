local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = ">", numhl = "RedSign" },
    { name = "DiagnosticSignWarn",  text = ">", numhl = "YellowSign" },
    { name = "DiagnosticSignHint",  text = ">", numhl = "BlueSign" },
    { name = "DiagnosticSignInfo",  text = ">", numhl = "BlueSign" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.numhl })
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/codeAction"] = vim.lsp.with(vim.lsp.handlers["textDocument/codeAction"], {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

M.on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
  -- if client.name == "clangd" then
  --   client.server_capabilities.signatureHelpProvider = false
  -- end

  local keymap = vim.keymap.set
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap('n', 'gd', function() vim.lsp.buf.definition() end, bufopts)
  keymap('n', 'K', function() vim.lsp.buf.hover() end, bufopts)
  keymap('n', ']d', function() vim.diagnostic.goto_next() end, bufopts)
  keymap('n', '[d', function() vim.diagnostic.goto_prev() end, bufopts)
  keymap('n', '<leader>lR', function() vim.lsp.buf.rename(vim.fn.input("Rename to: ")) end, bufopts)
  keymap('n', "<leader>lk", function() vim.lsp.buf.signature_help() end, bufopts)
  keymap("n", "<leader>lD", function() vim.lsp.buf.declaration() end, bufopts)
  keymap("n", "<leader>li", function() vim.lsp.buf.implementation() end, bufopts)
  keymap("n", "<leader>lr", function() vim.lsp.buf.references() end, bufopts)
  keymap("n", "<leader>lq", function() vim.diagnostic.setloclist() end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  M.capabilities = capabilities
else
  M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
