local ok, dap = pcall(require, "dap")
if not ok then
    return
end

local adapters = { "codelldb", "debugpy" }
local languages = { "c", "cpp", "rust", "python" }

-- set adapters configuration
for _, adapter in pairs(adapters) do
    dap.adapters[adapter] = require("core.language-server.debug.adapter."..adapter)
end

-- set languages configuration
for _, lang in ipairs(languages) do
    if lang == "c" or lang == "rust" then
        dap.configurations[lang] = require("core.language-server.debug.configuration.cpp")
    else
        dap.configurations[lang] = require("core.language-server.debug.configuration." .. lang)
    end
end

require("nvim-dap-virtual-text").setup({
    enabled = Arunvi.plugins.dap.virtualtext.enable,
})

-- Dap
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

local wk = require('which-key')

local mappings = {
    d = {
        name = "Debugging",
        b = {"<cmd>DapToggleBreakpoint<cr>","Toggle Breakpoint"},
        c = {"<cmd>DapContinue<cr>","Continue"},
        i = {"<cmd>DapStepInto<cr>","Step Into"},
        S = {"<cmd>DapStepOut<cr>","Step Out"},
        d = {"<cmd>lua Arunvi.plugins.dap.toggle_ui()<cr>","Toggle Debugger"},
    },
}
local prefix = {prefix = "<leader>"}

wk.register(mappings,prefix)
