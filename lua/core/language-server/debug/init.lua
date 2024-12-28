local status_ok, dap = pcall(require, "mason-nvim-dap")

if not status_ok then
    return
end

require("core.language-server.debug.dap")
require("core.language-server.debug.debug")

dap.setup({
    -- ensure_installed = {
    --     "codelldb", "debugpy"
    -- }
})
