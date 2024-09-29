local ok, ibl = pcall(require, "ibl")
if not ok then
  return
end

ibl.setup {
  enabled = true,

  exclude = {
    buftypes = { "terminal", "nofile"},
    filetypes = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "text",
      "python",
    }
  },

  indent = {
    char = "▏", --┇, ▏
    highlight = { "IndentBlanklineChar" },
  },

  whitespace = {
    -- highlight = { "Comment" },
    remove_blankline_trail = false,
  },

  scope = {
    enabled = false,
    show_start = false,
    show_end = false,
    highlight = "String",
    injected_languages = true,
    priority = 500,
  }
}
