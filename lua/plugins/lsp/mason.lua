return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    { "folke/neodev.nvim", opts = {} }
  },
  config = function()
    require("neodev").setup()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        G.Helper.Dependencies.HasGoCli() and "gopls" or nil,
        "emmet_ls",
        "emmet_language_server",
      }
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "pylint",
        "cpplint",
        "clangd"
      }
    })

    local servers = {
      ["emmet_ls"] = {
        capabilities = capabilities,
        filetypes = {
          "html", "css", "sass", "scss",
          "typescriptreact", "javascriptreact",
          "less", "svelte"
        }
      },
      ["lua_ls"] = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
            completion = {
              callSnippet = "Replace",
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              }
            }
          }
        }
      }
    }

    local function setup_lsp(servers)
      local default_config = {
        capabilities = capabilities
      }
      for server_name, opts in pairs(servers) do
        local config = vim.tbl_deep_extend("force", default_config, opts)
        lspconfig[server_name].setup(config)
      end
    end

    setup_lsp(servers)
  end
}
