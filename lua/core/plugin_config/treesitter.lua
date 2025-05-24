require('nvim-treesitter.configs').setup ({
  -- A list of parser names, or "all"
  ensure_installed = 'lua',
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = Arunvi.plugins.treesitter.enable,
    -- disable = {"css"},
    additional_vim_regex_highlighting = false,
  },
  autopairs = { enable = true, },
  rainbow = {
    enable = Arunvi.plugins.treesitter.rainbow.enable,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
  },
  indent = {
    enable = true,
    disable = {"yaml", "python"} -- list languages to disable
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-m>",
    }
  }

})

local parsers = require('nvim-treesitter.parsers')
function _G.ensure_treesitter_language_installed()
  local lang = parsers.get_buf_lang()
  if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
    vim.schedule_wrap(function()
      vim.cmd("TSInstallSync "..lang)
      vim.cmd[[e!]]
    end)()
  end
end

vim.cmd[[autocmd FileType * :lua ensure_treesitter_language_installed()]]
