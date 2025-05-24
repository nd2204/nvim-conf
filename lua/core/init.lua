-- require globals first
require("core.globals");

if vim.g.neovide then
  require("core.neovide")
end

-- after globals
require("core.configs");
require("core.lazy")
require("core.keymaps");
