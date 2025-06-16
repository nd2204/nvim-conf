if not G.Helper.Dependencies.HasCCPPCompiler() then
  vim.notify("treesiter: a C compiler is required for this plugins", vim.log.levels.WARN)
  return {}
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter.configs")
    require('nvim-treesitter.install').compilers = { "zig", "cc", "gcc", "clang" }

    ts.setup({
      ensure_installed = G.PluginConfig.treesitter.parsers,

      indent = {
        enable = true
      },

      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    })

    local parsers = require('nvim-treesitter.parsers')
    function _G.ensure_treesitter_language_installed()
      local lang = parsers.get_buf_lang()
      if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
        vim.schedule_wrap(function()
          vim.cmd("TSInstallSync " .. lang)
          vim.cmd [[e!]]
        end)()
      end
    end

    vim.cmd [[autocmd FileType * :lua ensure_treesitter_language_installed()]]
  end
}
