-- local Popup = require("nui.popup")
-- local Event = require("nui.utils.autocmd").event

local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local function get_height()
  return math.floor(vim.fn.winheight(0) * 0.3);
end

local function get_args()
  return vim.fn.input({
    prompt = "Enter Arguments (optional): ",
    default = "",
    cancelreturn = ""
  })
end

local aucmds = {
  cpp = {
    compile = "!g++ -std=c++17 -O2 -Wall -o main %",
    run = "%s split | term ./main %s",
    clean = "!rm main"
  },
  c = {
    compile = "!gcc -O2 -Wall -o main %",
    run = "%d split | term ./main %s",
    clean = "!rm main"
  },
  rs = "vsplit | term rustc --edition=2018 -C opt-level=3 % -o main && ./main ; rm main",
  py = "vsplit | term python3 %",
  lua = "luafile %"
}

local buffopts = {buffer = true, noremap = false}
for ext, ins in pairs(aucmds)  do
  api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*." .. ext},
    callback = function()
      vim.keymap.set({"n"}, "<leader>c", function()
        vim.cmd(ins.compile);
        vim.cmd(string.format(ins.run, get_height(), get_args()));
        vim.cmd(ins.clean);
      end, buffopts)
    end
  })
  -- print(ext, cmd)
end
