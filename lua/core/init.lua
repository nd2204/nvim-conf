-- require globals first
require("core.globals");

-- after globals
require("core.configs");
require("core.lazy")
require("core.keymaps");

if vim.g.neovide then
  require("core.neovide")
end
